<template>
  <div>
    <div class="nav">
      <Nav></Nav>
    </div>
    <div class="side-nav">
      <SideNav></SideNav>
    </div>

    <div class="profile-header">
      <div class="profile-image">
        <img src="https://avatars.githubusercontent.com/u/60940043?v=4" alt="User Image" />
      </div>
      <div class="profile-details">
        <h1>First Name Last Name</h1>
        <h2>City, Country</h2>
        <button>Edit Profile</button>
      </div>
    </div>

    <div class="container">

    <div class="card container">
        <h3>Last jobs apply</h3>
        <div class="card ">
          <div class="card-title">
            <h3>Job Title</h3>
          </div>
        </div>

    </div>
    </div>
  </div>
</template>

<script>
import SideNav from "~/components/SideNav.vue";

export default {
  name: "profile",
  components: { SideNav }
};
</script>

<style scoped>
.nav {
  position: relative;
  top: 0;
  left: 0;
  right: 0;
  background-color: #fff; /* adjust background color as desired */
  z-index: 1; /* the nav is in front of everything */
}

.side-nav {
  position: relative;
  z-index: 0; /* the side-nav is in the background */
}

.profile-header {
  margin-top: 50px; /* adjust margin as desired */
  display: flex;
  align-items: center;
  justify-content: center;
}

.profile-image {
  width: 200px; /* adjust image size as desired */
  height: 200px; /* adjust image size as desired */
  border-radius: 50%; /* make image circular */
  overflow: hidden;
}

.profile-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.profile-details {
  margin-left: 20px; /* adjust margin as desired */
}

.profile-details h1 {
  font-size: 32px; /* adjust font size as desired */
  font-weight: bold;
  margin-bottom: 10px; /* adjust margin as desired */
}

.profile-details h2 {
  font-size: 24px; /* adjust font size as desired */
  font-weight: normal;
  margin-bottom: 20px; /* adjust margin as desired */
}

button {
  background-color: #0077ff; /* adjust button color as desired */
  color: #fff; /* adjust button text color as desired */
  border: none;
  border-radius: 5px; /* adjust button border radius as desired */
  padding: 10px 20px; /* adjust button padding as desired */
  font-size: 18px; /* adjust button font size as desired */
  cursor: pointer;
}

.container {
  margin-top: 50px;
  display: flex;
  justify-content: center;
}

.card {
  width: 400px;
  background-color: #fff;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
  padding: 20px;
  border-radius: 5px;
}

.card h3 {
  font-size: 24px;
  margin-bottom: 10px;
}

.card p {
  font-size: 18px;
}
</style>
