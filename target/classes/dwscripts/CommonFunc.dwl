%dw 2.0

fun formatDate(x) = if(isEmpty(x)) null else (x as DateTime as String {format: "yyyy-MM-dd HH:mm:ss"})