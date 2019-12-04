<%-- 
    Document   : scripts
    Created on : 09-sep-2019, 20:03:38
    Author     : FelipeC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="assets/libs/js/main-js.js"></script>
    <script src="assets/vendor/parsley/parsley.js"></script>
    <script src="assets/vendor/inputmask/js/jquery.inputmask.bundle.js"></script>
    <script src="assets/vendor/custom-js/jquery.multi-select.html"></script>
    <script src="assets/vendor/charts/morris-bundle/Morrisjs.js"></script>
    <script src="assets/vendor/charts/morris-bundle/morris.js"></script>
    <script src="assets/vendor/charts/morris-bundle/raphael.min.js"></script>
    
    <!--TABLAS-->
    <script type="text/javascript" src="assets/DataTableStyle/js/Popper.js"></script>
	<script type="text/javascript" src="assets/DataTableStyle/js/jQuery.js"></script>
        <script type="text/javascript" src="assets/DataTableStyle/jQueryDatatables.js"></script>
        <script type="text/javascript" src="assets/DataTableStyle/BS4Datatables.js"></script>
        <script type="text/javascript" src="assets/DataTableStyle/DataResponsive.js"></script>
        <script type="text/javascript" src="assets/DataTableStyle/BSResponsive.js"></script>
<!--        <script type="text/javascript" src="assets/DataTableStyle/js/bootstrap.js"></script>-->
    
<!--Select2-->
    <script src="assets/DataTableStyle/select2.js"></script>

<script>
    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
    </script>
    <script>
    $(function(e) {
        "use strict";
        $(".date-inputmask").inputmask("dd/mm/yyyy"),
            $(".phone-inputmask").inputmask("999-9999"),
            $(".international-inputmask").inputmask("+99 (999-999-9999)"),
            $(".xphone-inputmask").inputmask("(999) 999-9999 / x999999"),
            $(".purchase-inputmask").inputmask("aaaa 9999-****"),
            $(".cc-inputmask").inputmask("9999 9999 9999 9999"),
            $(".ssn-inputmask").inputmask("999-99-9999"),
            $(".isbn-inputmask").inputmask("999-99-999-9999-9"),
            $(".currency-inputmask").inputmask("$9999"),
            $(".percentage-inputmask").inputmask("99%"),
            $(".decimal-inputmask").inputmask({
                alias: "decimal",
                radixPoint: "."
            }),

            $(".email-inputmask").inputmask({
                mask: "*{1,20}[.*{1,20}][.*{1,20}][.*{1,20}]@*{1,20}[*{2,6}][*{1,2}].*{1,}[.*{2,6}][.*{1,2}]",
                greedy: !1,
                onBeforePaste: function(n, a) {
                    return (e = e.toLowerCase()).replace("mailto:", "")
                },
                definitions: {
                    "*": {
                        validator: "[0-9A-Za-z!#$%&'*+/=?^_`{|}~/-]",
                        cardinality: 1,
                        casing: "lower"
                    }
                }
            })
    });
    </script>
    
        <script>
        $(document).ready(function(){
            $("#cajon2").hide();
            $('#datatable').DataTable( {
                    responsive: true
                });
            $('.single-select-search').select2();
        });
            function modificador(a,b){
                $("#cajon2").show();
                $("#cajon1").hide();
                $("#idEstM").val(a);
                $("#nombreEstM").val(b);
            };
            $(document).ready(function(){
                $("#Regresar").click(function() {
                    $("#cajon1").show();
                    $("#cajon2").hide();
                });
            });
            function modificador2(a,b,c,d,e,f){
                $("#cajon2").show();
                $("#cajon1").hide();
                $("#idSerM").val(a);
                $("#idPerM").val(b);
                $("#idEqM").val(c);
                $("#fechaIngresoSerM").val(d);
                $("#fechaEntregaSerM").val(e);
                $("#observacionesSerM").val(f);
            };
        </script>