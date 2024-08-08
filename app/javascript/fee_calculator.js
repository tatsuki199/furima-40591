document.addEventListener('DOMContentLoaded', () => {
  const amountField = document.getElementById('item-price');
  const feeResult = document.getElementById('fee-result');
  const totalResult = document.getElementById('total-result');

  amountField.addEventListener('input', () => {
    const amount = parseFloat(amountField.value) || 0;
    const fee = calculateFee(amount);
    const total = amount + fee;

    feeResult.textContent = fee.toFixed(2);
    totalResult.textContent = total.toFixed(2);
  });

  function calculateFee(amount) {
    return amount * 0.05; // 例として5%の手数料
  }
});