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
        
        arrProducts: [],
        product: {}
    },
    methods: {
        productGet(item){
            show(this.spinner)
            this.clearForm()
            fetch("productsApi?id="+item.id, {method:"get"})
            .then(response => response.json())
            .then(json => {
                this.product = json
            })
            .catch(() => sayError())
            .finally(() => hide(this.spinner))
        },
        productGetAll(){
            show(this.spinner)
            fetch("productsApi?all", {method:"get"})
            .then(response => response.json())
            .then(json => {
                this.arrProducts = json.arrProducts
            })
            .catch(() => sayError())
            .finally(() => hide(this.spinner))
        },
        productInsert(){
            show(this.spinner)
            let data = new URLSearchParams()
            data.append("product", JSON.stringify(this.product))
            
            fetch("productsApi", {method:"post", body:data})
            .then(response => {
                if (response.ok) sayOk()
                else sayError()
            })
            .finally(() => hide(this.spinner) | this.productGetAll())
        },
        productUpdate() {
            show(this.spinner)
            let data = new URLSearchParams()
            data.append("product", JSON.stringify(this.product))
            
            fetch("productsApi", {method:"put", body:data})
            .then(response => {
                if (response.ok) sayOk()
                else sayError()
            })
            .finally(() => hide(this.spinner) | this.productGetAll())
        },
        productDelete() {},
        productSearch() {},
        
        
        clearForm() {
            this.product = {}
        },
        getAux(aux, key) {
            for (let item of this.info[aux]) {
                if (item.key == key) return item
            }
        }
    },
    computed: {
        arrProducts10Comp() {
            let arrReverse = this.arrProducts.reverse()
            let arrResolve10 = []
            let max = 10
            let i = 0
            while (i < max && i < arrReverse.length) {
                arrResolve10.push(arrReverse[i])
                i++
            }
            return arrResolve10
        }
    },
    created() {
        fetch("../home", {method:"post"})
        .then(response => response.json())
        .then(json => {
            this.user = json.user
            this.info = json.info
            this.productGetAll()
        })
        .catch(() => sayError({text:"Se perdió la comunicación con el servidor"}))
    }
})
