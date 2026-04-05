# WHMCS Service Configuration: Managed Domain Services

This document outlines the configuration required in the WHMCS Admin Panel to support the 'Managed Domain Services' offerings in the WebOceanX theme.

## 1. Product Group
- **Name**: Managed Domain Services
- **Headline**: Expert Domain Management for Your Portfolio
- **Order Form Template**: WebOceanX (or Standard Cart)

## 2. Product: Basic Management
- **Type**: Other
- **Product Group**: Managed Domain Services
- **Product Name**: Basic Management
- **Pricing**:
  - **Payment Type**: Recurring
  - **Monthly**: $19.99
  - **Setup Fee**: $0.00
- **Module Settings**:
  - **Module Name**: None (or custom provisioning module if available)
- **Features (Custom Fields/Configurable Options)**:
  - **Domain Limit**: 5
  - **Automated Renewals**: Yes
  - **DNS Management**: Yes
  - **WHOIS Privacy**: Yes

## 3. Product: Professional Management
- **Type**: Other
- **Product Group**: Managed Domain Services
- **Product Name**: Professional Management
- **Pricing**:
  - **Payment Type**: Recurring
  - **Monthly**: $49.99
  - **Setup Fee**: $0.00
- **Module Settings**:
  - **Module Name**: None
- **Features**:
  - **Domain Limit**: 25
  - **Registry Lock**: Yes
  - **SSL Management**: Yes
  - **Priority Support**: Yes
  - **Quarterly Health Check**: Yes

## 4. Product: Enterprise Management
- **Type**: Other
- **Product Group**: Managed Domain Services
- **Product Name**: Enterprise Management
- **Pricing**:
  - **Payment Type**: Recurring
  - **Monthly**: $149.99
  - **Setup Fee**: $0.00
- **Module Settings**:
  - **Module Name**: None
- **Features**:
  - **Domain Limit**: Unlimited
  - **Dedicated Account Manager**: Yes
  - **Custom DNS Infrastructure**: Yes
  - **24/7 Phone Support**: Yes
  - **White-label Reporting**: Yes

## 5. Provisioning & Feature Allocation
- **Welcome Email**: Managed Domain Services Welcome Email
- **Auto-Provisioning**: On payment confirmation
- **Custom Fields**:
  - `Domain Portfolio List` (Textarea)
  - `Primary Contact for Management` (Text)

---
*Note: These configurations ensure the theme's pricing tables and cart links function correctly.*
