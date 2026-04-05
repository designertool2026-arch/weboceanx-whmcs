<div class="row justify-content-center py-5">
    <div class="col-md-8 col-lg-6">
        <div class="card border-0 shadow-lg rounded-4 overflow-hidden">
            <div class="card-header bg-dark-green text-white p-5 text-center">
                <h2 class="fw-bold mb-3 text-neon">Create Account</h2>
                <p class="opacity-75 mb-0">Join Web Oceanx today and start your hosting journey.</p>
            </div>
            <div class="card-body p-5">
                <form method="post" action="register.php" role="form">
                    <div class="row g-4 mb-4">
                        <div class="col-md-6">
                            <label class="form-label fw-bold">First Name</label>
                            <input type="text" name="firstname" class="form-control bg-light border-0 rounded-pill px-4 py-2" placeholder="First Name" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Last Name</label>
                            <input type="text" name="lastname" class="form-control bg-light border-0 rounded-pill px-4 py-2" placeholder="Last Name" required>
                        </div>
                        <div class="col-md-12">
                            <label class="form-label fw-bold">Email Address</label>
                            <input type="email" name="email" class="form-control bg-light border-0 rounded-pill px-4 py-2" placeholder="Email Address" required>
                        </div>
                        <div class="col-md-12">
                            <label class="form-label fw-bold">Phone Number</label>
                            <input type="tel" name="phonenumber" class="form-control bg-light border-0 rounded-pill px-4 py-2" placeholder="Phone Number" required>
                        </div>
                        <div class="col-md-12">
                            <label class="form-label fw-bold">Company Name (Optional)</label>
                            <input type="text" name="companyname" class="form-control bg-light border-0 rounded-pill px-4 py-2" placeholder="Company Name">
                        </div>
                        <div class="col-md-12">
                            <label class="form-label fw-bold">Address</label>
                            <input type="text" name="address1" class="form-control bg-light border-0 rounded-pill px-4 py-2 mb-3" placeholder="Address 1" required>
                            <input type="text" name="address2" class="form-control bg-light border-0 rounded-pill px-4 py-2" placeholder="Address 2 (Optional)">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">City</label>
                            <input type="text" name="city" class="form-control bg-light border-0 rounded-pill px-4 py-2" placeholder="City" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">State</label>
                            <input type="text" name="state" class="form-control bg-light border-0 rounded-pill px-4 py-2" placeholder="State" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Postcode</label>
                            <input type="text" name="postcode" class="form-control bg-light border-0 rounded-pill px-4 py-2" placeholder="Postcode" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Country</label>
                            <select name="country" class="form-select bg-light border-0 rounded-pill px-4 py-2" required>
                                <option value="US">United States</option>
                                <option value="GB">United Kingdom</option>
                                <option value="CA">Canada</option>
                                <!-- Add more countries as needed -->
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Password</label>
                            <input type="password" name="password" class="form-control bg-light border-0 rounded-pill px-4 py-2" placeholder="Password" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Confirm Password</label>
                            <input type="password" name="confirmpassword" class="form-control bg-light border-0 rounded-pill px-4 py-2" placeholder="Confirm Password" required>
                        </div>
                    </div>
                    
                    <div class="form-check mb-4">
                        <input class="form-check-input" type="checkbox" id="termsCheck" required>
                        <label class="form-check-label small text-muted" for="termsCheck">
                            I agree to the <a href="#" class="text-success text-decoration-none fw-bold">Terms of Service</a> and <a href="#" class="text-success text-decoration-none fw-bold">Privacy Policy</a>.
                        </label>
                    </div>
                    
                    <button type="submit" class="btn btn-neon w-100 rounded-pill py-3 fw-bold shadow-lg">Register Account</button>
                </form>
                
                <div class="text-center mt-5">
                    <p class="text-muted mb-0">Already have an account? <a href="login.php" class="text-success text-decoration-none fw-bold">Login Here</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
