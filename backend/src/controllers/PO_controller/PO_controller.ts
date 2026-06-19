import type { Request, Response } from 'express';
import { prisma } from '../../prisma.ts';

export const createPurchaseOrder = async (req: Request, resp: Response) => {
  const { quantity, totalAmount, supplierId, confirmed, status, createdBy, itemId } = req.body;
  const purchaseOrder = await prisma.purchaseOrder.create({
    data: {
      quantity,
      totalAmount,
      supplierId,
      confirmed,
      status,
      createdBy,
      itemId,
    },
  });
  console.log('Created Purchase Order:', purchaseOrder);
  resp.json(purchaseOrder);
};

export const getAllPurchaseOrders = async (req: Request, resp: Response) => {
  const purchaseOrders = await prisma.purchaseOrder.findMany({
    include: {
      item: true,
      supplier: true,
      procurementOfficer: true,
    },
  });
  resp.json(purchaseOrders);
};

export const getPurchaseOrderById = async (req: Request, resp: Response) => {
  const poId = Number(req.params.id);
  if (Number.isNaN(poId)) {
    resp.status(400).json({ error: 'Invalid purchase order ID' });
    return;
  }

  const purchaseOrder = await prisma.purchaseOrder.findUnique({
    where: { poId },
    include: {
      item: true,
      supplier: true,
      procurementOfficer: true,
    },
  });

  if (!purchaseOrder) {
    resp.status(404).json({ error: 'Purchase order not found' });
    return;
  }

  resp.json(purchaseOrder);
};

export const updatePurchaseOrder = async (req: Request, resp: Response) => {
  const poId = Number(req.params.id);
  if (Number.isNaN(poId)) {
    resp.status(400).json({ error: 'Invalid purchase order ID' });
    return;
  }

  const { quantity, totalAmount, supplierId, confirmed, status, createdBy, itemId } = req.body;
  const purchaseOrder = await prisma.purchaseOrder.update({
    where: { poId },
    data: {
      quantity,
      totalAmount,
      supplierId,
      confirmed,
      status,
      createdBy,
      itemId,
    },
  });

  resp.json(purchaseOrder);
};

export const deletePurchaseOrder = async (req: Request, resp: Response) => {
  const poId = Number(req.params.id);
  if (Number.isNaN(poId)) {
    resp.status(400).json({ error: 'Invalid purchase order ID' });
    return;
  }

  await prisma.purchaseOrder.delete({
    where: { poId },
  });

  resp.json({ message: 'Purchase order deleted successfully' });
};
