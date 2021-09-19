/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var app = new Vue({
    el: "#app",
    data: {
        user: {},
        info: {},
        
        arrPurchases: [],
        purchase: {},
        
        arrProviders: [],
        arrProducts: []
    },
    methods: {
        purchaseGet(item){
            Mandarina.spinnerShow()
            fetch("purchasesApi?id="+item.id, {method:"get"})
            .then(response => response.json())
            .then(json => this.purchase = json)
            .catch(() => Mandarina.error({}))
            .finally(() => Mandarina.spinnerHide())
        },
        purchaseGetAll(){
            Mandarina.spinnerShow()
            fetch("purchasesApi?all", {method:"get"})
            .then(response => response.json())
            .then(json => {
                this.arrPurchases = json.arrPurchases
                this.arrProviders = json.arrProviders
                this.arrProducts = json.arrProducts
            })
            .catch(() => Mandarina.error({}))
            .finally(() => Mandarina.spinnerHide())
        },
        purchaseInsert(){
            Mandarina.spinnerShow()
            let data = new URLSearchParams()
            data.append("purchase", JSON.stringify(this.purchase))
            
            fetch("purchasesApi", {method:"post", body:data})
            .then(response => {
                if (response.ok) Mandarina.ok({})
                else Mandarina.error({})
            })
            .finally(() => Mandarina.spinnerHide() | this.purchaseGetAll())
        },
        purchaseUpdate() {
            Mandarina.spinnerShow()
            let data = new URLSearchParams()
            data.append("purchase", JSON.stringify(this.purchase))
            
            fetch("purchasesApi", {method:"put", body:data})
            .then(response => {
                if (response.ok) Mandarina.ok({})
                else Mandarina.error({})
            })
            .finally(() => Mandarina.spinnerHide() | this.purchaseGetAll())
        },
        purchaseDelete() {},
        purchaseSearch() {},
        
        
        clearForm() {
            this.purchase = {}
        },
        getAux(aux, key) {
            for (let item of this.info[aux]) {
                if (item.key == key) return item
            }
        }
    },
    computed: {
        arrPurchases10Comp() {
            let arrReverse = this.arrPurchases.reverse()
            let arrResolve10 = []
            let max = 10
            let i = 0
            while (i < max && i < arrReverse.length) {
                arrResolve10.push(arrReverse[i])
                i++
            }
            return arrResolve10
        },
        arrOrdersComp() {
            arrOrders = []
            for (let item of this.arrPurchases) {
                if (item.state == "P") arrOrders.push(item)
            }
            return arrOrders
        }
    },
    created() {
        fetch("../home", {method:"post"})
        .then(response => response.json())
        .then(json => {
            this.user = json.user
            this.info = json.info
            this.purchaseGetAll()
        })
        .catch(() => Mandarina.error({text:"Se perdió la comunicación con el servidor"}))
    }
})
