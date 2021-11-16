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
        
        arrInventories: [],
        inventory: {}
    },
    methods: {
        inventoryGet(item){
            show(this.spinner)
            this.clearForm()
            fetch("inventoryApi?id="+item.id, {method:"get"})
            .then(response => response.json())
            .then(json => this.inventory = json)
            .catch(() => sayError())
            .finally(() => hide(this.spinner))
        },
        inventoryGetAll(){
            show(this.spinner)
            fetch("inventoryApi?all", {method:"get"})
            .then(response => response.json())
            .then(json => this.arrInventories = json)
            .catch(() => sayError())
            .finally(() => hide(this.spinner))
        },
        inventoryInsert(){
            show(this.spinner)
            let data = new URLSearchParams()
            data.append("inventory", JSON.stringify(this.inventory))
            
            fetch("inventoryApi", {method:"post", body:data})
            .then(response => {
                if (response.ok) sayOk()
                else sayError()
            })
            .finally(() => hide(this.spinner) | this.inventoryGetAll())
        },
        inventoryUpdate() {
            show(this.spinner)
            let data = new URLSearchParams()
            data.append("inventory", JSON.stringify(this.inventory))
            
            fetch("inventoryApi", {method:"put", body:data})
            .then(response => {
                if (response.ok) sayOk()
                else sayError()
            })
            .finally(() => hide(this.spinner) | this.inventoryGetAll())
        },
        inventoryDelete() {},
        inventorySearch() {},
        
        
        clearForm() {
            this.inventory = {}
        },
        getAux(aux, key) {
            for (let item of this.info[aux]) {
                if (item.key == key) return item
            }
        }
    },
    computed: {
        arrInventories10Comp() {
            let arrTemp = this.arrInventories.sort((a,b)=>(a>b)?1:-1)
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
        arrSpentsComp() {
            arrSpents = []
            for (let item of this.arrInventories) {
                if (item.stock <= item.minStock && item.state == 'A') arrSpents.push(item)
            }
            return arrSpents
        },
        totalStockComp() {
            let total = 0
            for (let inventory of this.arrInventories) {
                if (inventory.state == 'A') total += parseInt(inventory.stock)
            }
            return total
        },
        totalOrdersComp() {
            let total = 0
            for (let inventory of this.arrInventories) {
                if (inventory.state == 'P') total += parseInt(inventory.stock)
            }
            return total
        }
    },
    created() {
        fetch("../home", {method:"post"})
        .then(response => response.json())
        .then(json => {
            this.user = json.user
            this.info = json.info
            this.inventoryGetAll()
        })
        .catch(() => sayError({text:"Se perdió la comunicación con el servidor"}))
    }
})
