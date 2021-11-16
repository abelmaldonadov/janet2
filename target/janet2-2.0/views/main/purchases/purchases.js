/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var app = new Vue({
    el: "#app",
    data: {
        spinner: '#gajo-spinner',
        user: {},
        info: {},
        
        arrPurchases: [],
        purchase: {
            product: 0,
            shipping: 0,
            taxes: 0,
            others: 0,
            unitary: 0,
            quantity: 0
        },
        
        arrProviders: [],
        arrProducts: []
    },
    methods: {
        purchaseGet(item){
            show(this.spinner)
            fetch("purchasesApi?id="+item.id, {method:"get"})
            .then(response => response.json())
            .then(json => this.purchase = json)
            .catch(() => sayError())
            .finally(() => hide(this.spinner))
        },
        purchaseGetAll(){
            show(this.spinner)
            fetch("purchasesApi?all", {method:"get"})
            .then(response => response.json())
            .then(json => {
                this.arrPurchases = json.arrPurchases
                this.arrProviders = json.arrProviders
                this.arrProducts = json.arrProducts
            })
            .catch(() => sayError())
            .finally(() => hide(this.spinner))
        },
        purchaseInsert(){
            show(this.spinner)
            let data = new URLSearchParams()
            data.append("purchase", JSON.stringify(this.purchase))
            
            fetch("purchasesApi", {method:"post", body:data})
            .then(response => {
                if (response.ok) sayOk()
                else sayError()
            })
            .finally(() => hide(this.spinner) | this.purchaseGetAll())
        },
        purchaseUpdate() {
            show(this.spinner)
            let data = new URLSearchParams()
            data.append("purchase", JSON.stringify(this.purchase))
            
            fetch("purchasesApi", {method:"put", body:data})
            .then(response => {
                if (response.ok) sayOk()
                else sayError()
            })
            .finally(() => hide(this.spinner) | this.purchaseGetAll())
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
        },
        totalPurchasesComp() {
            let totalPurchases = 0
            for (let purchase of this.arrPurchases) {
                totalPurchases += parseFloat(purchase.totalCost)
            }
            return totalPurchases.toFixed(2)
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
        .catch(() => sayError({text:"Se perdió la comunicación con el servidor"}))
    }
})
