/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

let app = new Vue({
    el: "#app",
    data: {
        spinner: '#gajo-spinner',
        user: {},
        info: {},
        
        arrSales: [],
        sale: {},
        
        arrInventories: [],
        arrVendors: []
    },
    methods: {
        saleGet(item){
            show(this.spinner)
            fetch("salesApi?id="+item.id, {method:"get"})
            .then(response => response.json())
            .then(json => this.sale = json)
            .catch(() => sayError())
            .finally(() => hide(this.spinner))
        },
        saleGetAll(){
            show(this.spinner)
            fetch("salesApi?all", {method:"get"})
            .then(response => response.json())
            .then(json => {
                this.arrSales = json.arrSales
                this.arrInventories = json.arrInventories
                this.arrVendors = json.arrVendors
            })
            .catch(() => sayError())
            .finally(() => hide(this.spinner))
        },
        saleInsert(){
            show(this.spinner)
            let data = new URLSearchParams()
            data.append("sale", JSON.stringify(this.sale))
            
            fetch("salesApi", {method:"post", body:data})
            .then(response => {
                if (response.ok) sayOk()
                else sayError()
            })
            .finally(() => hide(this.spinner) | this.saleGetAll())
        },
        saleUpdate() {
            show(this.spinner)
            let data = new URLSearchParams()
            data.append("sale", JSON.stringify(this.sale))
            
            fetch("salesApi", {method:"put", body:data})
            .then(response => {
                if (response.ok) sayOk()
                else sayError()
            })
            .finally(() => hide(this.spinner) | this.saleGetAll())
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
            let arrTemp = this.arrSales.sort((a,b)=>(a>b)?1:-1)
            let arrResolve10 = []
            let cant = 0
            arrTemp.forEach(item => {
                if (cant<10) {
                    arrResolve10.push(item)
                    cant++
                }
            })
            return arrResolve10
        },
        arrDeliveriesComp() {
            let arrDeliveries = []
            for (let item of this.arrSales) {
                if (item.state == "P") arrDeliveries.push(item)
            }
            return arrDeliveries
        },
        totalSalesComp() {
            let totalSales = 0
            for (let sale of this.arrSales) {
                totalSales += parseFloat(sale.totalPrice)
            }
            return totalSales.toFixed(2)
        },
        totalSalesCashComp() {
            let totalSales = 0
            for (let sale of this.arrSales) {
                if (sale.channel == '1' && sale.state == 'A') {
                    totalSales += parseFloat(sale.totalPrice)
                }
            }
            return totalSales.toFixed(2)
        },
        totalSalesBanksComp() {
            let totalSales = 0
            for (let sale of this.arrSales) {
                if (sale.channel != '1' && sale.state == 'A') {
                    totalSales += parseFloat(sale.totalPrice)
                }
            }
            return totalSales.toFixed(2)
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
        .catch(() => sayError({text:"Se perdió la comunicación con el servidor"}))
    }
})
