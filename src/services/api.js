// src/services/api.js
const API_URL = import.meta.env.VITE_API_URL;

export const apiService = {
  async getServices() {
    try {
      const response = await fetch(`${API_URL}/services`);
      if (!response.ok) throw new Error('Network response was not ok');
      return await response.json();
    } catch (error) {
      console.error('Error fetching services:', error);
      throw error;
    }
  },

  async getService(id) {
    try {
      const response = await fetch(`${API_URL}/services/${id}`);
      if (!response.ok) throw new Error('Network response was not ok');
      return await response.json();
    } catch (error) {
      console.error('Error fetching service:', error);
      throw error;
    }
  },

  async submitContact(formData) {
    try {
      const response = await fetch(`${API_URL}/contact`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(formData),
      });
      if (!response.ok) throw new Error('Network response was not ok');
      return await response.json();
    } catch (error) {
      console.error('Error submitting contact form:', error);
      throw error;
    }
  },
};