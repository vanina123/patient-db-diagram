CREATE TABLE medical_histories (
    id int Primary Key,
    admitted_at timestamp,
    patient_id int,
    status varchar(255)
    CONSTRAINT fk_patients FOREIGN KEY(patient_id) REFERENCES patients(id)

);

CREATE TABLE patients(
    id int Primary key,
    name varchar(255),
    date_of_birth date
);


CREATE TABLE invoices (
    id int PRIMARY key,
    total_amount DECIMAL,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id int
    CONSTRAINT fk_medical_history_id FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items(
    id int PRIMARY KEY,
    unit_price DECIMAL,
    quantity int,
    total_price DECIMAL,
    invoice_id int,
    treatment_id int,
    CONSTRAINT fk_invoices FOREIGN KEY(invoices_id) REFERENCES invoices(id),
    CONSTRAINT fk_treatments FOREIGN KEY(treatments_id) REFERENCES treatments(id)
);

CREATE TABLE treatments(
    id int PRIMARY key,
    type VARCHAR(255),
    name varchar(255)
);

CREATE TABLE medical_treament_history(
    medical_histories_id int,
    treatment_id int,
    CONSTRAINT fk_medical_history_id FOREIGN key(medical_histories_id) REFERENCES medical_histories(id),
    CONSTRAINT fk_treatments FOREIGN KEY(treatments_id) REFERENCES treatments(id),
    PRIMARY  key (medical_histories_id, treatment_id)
);

-- Indexes for foreign keys

-- Index for medical_histories.patient_id
CREATE INDEX idx_medical_histories_patient_id ON medical_histories (patient_id);

-- Index for invoices.medical_history_id
CREATE INDEX idx_invoices_medical_history_id ON invoices (medical_history_id);

-- Index for invoice_items.invoice_id
CREATE INDEX idx_invoice_items_invoice_id ON invoice_items (invoice_id);

-- Index for invoice_items.treatment_id
CREATE INDEX idx_invoice_items_treatment_id ON invoice_items (treatment_id);

-- Index for medical_treatment_history.medical_histories_id
CREATE INDEX idx_medical_treatment_history_medical_histories_id ON medical_treatment_history (medical_histories_id);

-- Index for medical_treatment_history.treatment_id
CREATE INDEX idx_medical_treatment_history_treatment_id ON medical_treatment_history (treatment_id);
