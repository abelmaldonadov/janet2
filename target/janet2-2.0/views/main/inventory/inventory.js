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
        
        arrInventories: [],
        inventory: {}
    },
    methods: {
        inventoryGet(item){
            Mandarina.spinnerShow()
            this.clearForm()
            fetch("inventoryApi?id="+item.id, {method:"get"})
            .then(response => response.json())
            .then(json => this.inventory = json)
            .catch(() => Mandarina.error({}))
            .finally(() => Mandarina.spinnerHide())
        },
        inventoryGetAll(){
            Mandarina.spinnerShow()
            fetch("inventoryApi?all", {method:"get"})
            .then(response => response.json())
            .then(json => this.arrInventories = json)
            .catch(() => Mandarina.error({}))
            .finally(() => Mandarina.spinnerHide())
        },
        inventoryInsert(){
            Mandarina.spinnerShow()
            let data = new URLSearchParams()
            data.append("inventory", JSON.stringify(this.inventory))
            
            fetch("inventoryApi", {method:"post", body:data})
            .then(response => {
                if (response.ok) Mandarina.ok({})
                else Mandarina.error({})
            })
            .finally(() => Mandarina.spinnerHide() | this.inventoryGetAll())
        },
        inventoryUpdate() {
            Mandarina.spinnerShow()
            let data = new URLSearchParams()
            data.append("inventory", JSON.stringify(this.inventory))
            
            fetch("inventoryApi", {method:"put", body:data})
            .then(response => {
                if (response.ok) Mandarina.ok({})
                else Mandarina.error({})
            })
            .finally(() => Mandarina.spinnerHide() | this.inventoryGetAll())
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
            let arrReverse = this.arrInventories.reverse()
            let arrResolve10 = []
            let max = 10
            let i = 0
            while (i < max && i < arrReverse.length) {
                arrResolve10.push(arrReverse[i])
                i++
            }
            return arrResolve10
        },
        arrSpentsComp() {
            arrSpents = []
            for (let item of this.arrInventories) {
                if (item.stock <= item.minStock) arrSpents.push(item)
            }
            return arrSpents
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
        .catch(() => Mandarina.error({text:"Se perdió la comunicación con el servidor"}))
    }
})
