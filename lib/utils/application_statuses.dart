String applicationStatuses(int status) {
  String strStatus = "";
  switch (status) {
    case 1:
      strStatus = "Ingresada";
      break;
    case 2:
      strStatus = "Análisis";
      break;
    case 3:
      strStatus = "Aprobada";
      break;
    case 4:
      strStatus = "Denegada";
      break;
    case 5:
      strStatus = "Desembolso";
      break;
    case 6:
      strStatus = "Pendiente de pago";
      break;
    case 7:
      strStatus = "Pagada";
      break;
    case 8:
      strStatus = "Cancelada";
      break;
    case 9:
      strStatus = "Finalizada";
      break;
  }
  return strStatus;
}
