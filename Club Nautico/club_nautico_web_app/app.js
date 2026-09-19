// Club Náutico - Core Application JavaScript

document.addEventListener('DOMContentLoaded', () => {
  initMobileMenu();
  initModals();
  initSearchFilter();
  initFormSubmitHandlers();
});

// Mobile Sidebar Toggle
function initMobileMenu() {
  const toggleBtn = document.getElementById('mobileMenuToggle');
  const sidebar = document.querySelector('.sidebar');
  
  if (toggleBtn && sidebar) {
    toggleBtn.addEventListener('click', () => {
      sidebar.classList.toggle('mobile-open');
    });
  }
}

// Modal Dialog Controls
function initModals() {
  const openModalBtns = document.querySelectorAll('[data-modal-target]');
  const closeModalBtns = document.querySelectorAll('[data-modal-close]');
  
  openModalBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      const modalId = btn.getAttribute('data-modal-target');
      const modal = document.getElementById(modalId);
      if (modal) {
        modal.classList.add('active');
      }
    });
  });

  closeModalBtns.forEach(btn => {
    btn.addEventListener('click', () => {
      const modal = btn.closest('.modal-backdrop');
      if (modal) {
        modal.classList.remove('active');
      }
    });
  });

  // Close when clicking outside modal box
  window.addEventListener('click', (e) => {
    if (e.target.classList.contains('modal-backdrop')) {
      e.target.classList.remove('active');
    }
  });
}

// Table Search Filtering
function initSearchFilter() {
  const searchInput = document.getElementById('tableSearchInput');
  if (!searchInput) return;

  searchInput.addEventListener('input', (e) => {
    const term = e.target.value.toLowerCase();
    const rows = document.querySelectorAll('.data-table tbody tr');

    rows.forEach(row => {
      const text = row.textContent.toLowerCase();
      row.style.display = text.includes(term) ? '' : 'none';
    });
  });
}

// Form Submission Simulation & Validation
function initFormSubmitHandlers() {
  const forms = document.querySelectorAll('form[data-action-submit]');
  
  forms.forEach(form => {
    form.addEventListener('submit', (e) => {
      e.preventDefault();
      
      const modal = form.closest('.modal-backdrop');
      if (modal) {
        modal.classList.remove('active');
      }

      showNotification('Registro guardado exitosamente');
      form.reset();
    });
  });
}

// Toast Notification Helper
function showNotification(message) {
  const toast = document.createElement('div');
  toast.className = 'toast-notification';
  toast.innerText = message;
  toast.style.cssText = `
    position: fixed;
    bottom: 24px;
    right: 24px;
    background-color: var(--primary-navy);
    color: white;
    padding: 12px 24px;
    border-radius: var(--radius-md);
    box-shadow: var(--shadow-lg);
    z-index: 2000;
    font-weight: 500;
    border-left: 4px solid var(--accent-caribbean);
    animation: fadeIn 0.3s ease;
  `;

  document.body.appendChild(toast);

  setTimeout(() => {
    toast.remove();
  }, 3000);
}
