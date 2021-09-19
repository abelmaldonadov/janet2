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
        
        arrCustomers: [],
        customer: {}
    },
    methods: {
        customerGet(item){
            Mandarina.spinnerShow()
            fetch("customersApi?id="+item.id, {method:"get"})
            .then(response => response.json())
            .then(json => this.customer = json)
            .catch(() => Mandarina.error({}))
            .finally(() => Mandarina.spinnerHide())
        },
        customerGetAll(){
            Mandarina.spinnerShow()
            fetch("customersApi?all", {method:"get"})
            .then(response => response.json())
            .then(json => this.arrCustomers = json)
            .catch(() => Mandarina.error({}))
            .finally(() => Mandarina.spinnerHide())
        },
        customerInsert(){
            Mandarina.spinnerShow()
            let data = new URLSearchParams()
            data.append("customer", JSON.stringify(this.customer))
            
            fetch("customersApi", {method:"post", body:data})
            .then(response => {
                if (response.ok) Mandarina.ok({})
                else Mandarina.error({})
            })
            .finally(() => Mandarina.spinnerHide() | this.customerGetAll())
        },
        customerUpdate() {
            Mandarina.spinnerShow()
            let data = new URLSearchParams()
            data.append("customer", JSON.stringify(this.customer))
            
            fetch("customersApi", {method:"put", body:data})
            .then(response => {
                if (response.ok) Mandarina.ok({})
                else Mandarina.error({})
            })
            .finally(() => Mandarina.spinnerHide() | this.customerGetAll())
        },
        customerDelete() {},
        customerSearch() {},
        
        
        clearForm() {
            this.customer = {}
        },
        getAux(aux, key) {
            for (let item of this.info[aux]) {
                if (item.key == key) return item
            }
        }
    },
    computed: {
        arrCustomers10Comp() {
            let arrReverse = this.arrCustomers.reverse()
            let arrResolve10 = []
            let max = 10
            let i = 0
            while (i < max && i < arrReverse.length) {
                arrResolve10.push(arrReverse[i])
                i++
            }
            return arrResolve10
        },
        arrBlacklistComp() {
            arrBlacklist = []
            for (let item of this.arrCustomers) {
                if (item.blacklist == "1") arrBlacklist.push(item)
            }
            return arrBlacklist
        }
    },
    created() {
        fetch("../home", {method:"post"})
        .then(response => response.json())
        .then(json => {
            this.user = json.user
            this.info = json.info
            this.customerGetAll()
        })
        .catch(() => Mandarina.error({text:"Se perdió la comunicación con el servidor"}))
    }
})
