import type { Request, Response } from 'express';
import { prisma } from '../../prisma.ts';

export const createSupplier = async (req: Request, resp: Response) => {
  const { suppliername, contactPerson, email, phone, address, paymentTerms, status } = req.body;
  const supplier = await prisma.supplier.create({
    data: {
      suppliername,
      contactPerson,
      email,
      phone,
      address,
      paymentTerms,
      status,
    },
  });
  resp.json(supplier);
};

export const getAllSuppliers = async (req: Request, resp: Response) => {
  const suppliers = await prisma.supplier.findMany({
    include: {
      items: true,
      purchaseOrders: true,
    },
  });
  resp.json(suppliers);
};

export const getSupplierById = async (req: Request, resp: Response) => {
  const supplierId = Number(req.params.id);
  if (Number.isNaN(supplierId)) {
    resp.status(400).json({ error: 'Invalid supplier ID' });
    return;
  }

  const supplier = await prisma.supplier.findUnique({
    where: { supplierId },
    include: {
      items: true,
      purchaseOrders: true,
    },
  });

  if (!supplier) {
    resp.status(404).json({ error: 'Supplier not found' });
    return;
  }

  resp.json(supplier);
};

export const updateSupplier = async (req: Request, resp: Response) => {
  const supplierId = Number(req.params.id);
  if (Number.isNaN(supplierId)) {
    resp.status(400).json({ error: 'Invalid supplier ID' });
    return;
  }

  const { suppliername, contactPerson, email, phone, address, paymentTerms, status } = req.body;
  const supplier = await prisma.supplier.update({
    where: { supplierId },
    data: {
      suppliername,
      contactPerson,
      email,
      phone,
      address,
      paymentTerms,
      status,
    },
  });

  resp.json(supplier);
};

export const deleteSupplier = async (req: Request, resp: Response) => {
  const supplierId = Number(req.params.id);
  if (Number.isNaN(supplierId)) {
    resp.status(400).json({ error: 'Invalid supplier ID' });
    return;
  }

  await prisma.supplier.delete({
    where: { supplierId },
  });

  resp.json({ message: 'Supplier deleted successfully' });
};
