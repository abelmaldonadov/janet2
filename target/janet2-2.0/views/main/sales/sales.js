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
        
        arrSales: [],
        sale: {},
        
        arrInventories: [],
        arrVendors: []
    },
    methods: {
        saleGet(item){
            Mandarina.spinnerShow()
            fetch("salesApi?id="+item.id, {method:"get"})
            .then(response => response.json())
            .then(json => this.sale = json)
            .catch(() => Mandarina.error({}))
            .finally(() => Mandarina.spinnerHide())
        },
        saleGetAll(){
            Mandarina.spinnerShow()
            fetch("salesApi?all", {method:"get"})
            .then(response => response.json())
            .then(json => {
                this.arrSales = json.arrSales
                this.arrInventories = json.arrInventories
                this.arrVendors = json.arrVendors
            })
            .catch(() => Mandarina.error({}))
            .finally(() => Mandarina.spinnerHide())
        },
        saleInsert(){
            Mandarina.spinnerShow()
            let data = new URLSearchParams()
            data.append("sale", JSON.stringify(this.sale))
            
            fetch("salesApi", {method:"post", body:data})
            .then(response => {
                if (response.ok) Mandarina.ok({})
                else Mandarina.error({})
            })
            .finally(() => Mandarina.spinnerHide() | this.saleGetAll())
        },
        saleUpdate() {
            Mandarina.spinnerShow()
            let data = new URLSearchParams()
            data.append("sale", JSON.stringify(this.sale))
            
            fetch("salesApi", {method:"put", body:data})
            .then(response => {
                if (response.ok) Mandarina.ok({})
                else Mandarina.error({})
            })
            .finally(() => Mandarina.spinnerHide() | this.saleGetAll())
        },
        saleDelete() {},
        saleSearch() {},
        
        
        clearForm() {
            this.sale = {}
        },
        getAux(aux, key) {
            for (let item of this.info[aux]) {
                if (item.key == key) return item
            }
        }
    },
    computed: {
        arrSales10Comp() {
            let arrReverse = this.arrSales.reverse()
            let arrResolve10 = []
            let max = 10
            let i = 0
            while (i < max && i < arrReverse.length) {
                arrResolve10.push(arrReverse[i])
                i++
            }
            return arrResolve10
        },
        arrDeliveriesComp() {
            arrDeliveries = []
            for (let item of this.arrSales) {
                if (item.state == "P") arrDeliveries.push(item)
            }
            return arrDeliveries
        }
    },
    created() {
        fetch("../home", {method:"post"})
        .then(response => response.json())
        .then(json => {
            this.user = json.user
            this.info = json.info
            this.saleGetAll()
        })
        .catch(() => Mandarina.error({text:"Se perdió la comunicación con el servidor"}))
    }
})
