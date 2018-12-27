function change_date(month, year) {
    window.location.href = "/?m=" + month + "&y=" + year;
}

function prev_date(month, year) {
    if (month > 1) change_date(month - 1, year);
    else change_date(12, year - 1);
}

function next_date(month, year) {
    if (month < 12) change_date(month + 1, year);
    else change_date(1, year + 1);
}