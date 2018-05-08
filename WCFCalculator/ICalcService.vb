﻿' NOTE: You can use the "Rename" command on the context menu to change the interface name "IService1" in both code and config file together.
<ServiceContract()>
Public Interface ICalcService

    <OperationContract()>
    Function Add(ByVal a As Decimal, ByVal b As Decimal) As Decimal

    <OperationContract()>
    Function Subtract(ByVal a As Decimal, ByVal b As Decimal) As Decimal

    <OperationContract()>
    Function Multiply(ByVal a As Decimal, ByVal b As Decimal) As Decimal

    <OperationContract()>
    Function Divide(ByVal a As Decimal, ByVal b As Decimal) As Decimal

End Interface
