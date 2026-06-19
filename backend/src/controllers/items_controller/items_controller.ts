import type { Request, Response } from 'express';
import { prisma } from '../../prisma.ts';

export const createItem = async (req: Request, resp: Response) => {
  const { itemname, sku, quantity, minStock, supplierId, rfidCode } = req.body;
  const item = await prisma.item.create({
    data: {
      itemname,
      sku,
      quantity,
      minStock: minStock ?? 30,
      supplierId,
      rfidCode,
    },
  });
  resp.json(item);
};

export const getAllItems = async (req: Request, resp: Response) => {
  const items = await prisma.item.findMany({
    include: {
      supplier: true,
      purchaseOrders: true,
      scanRecords: true,
      rfidTag: true,
    },
  });
  resp.json(items);
};

export const getItemById = async (req: Request, resp: Response) => {
  const itemId = Number(req.params.id);
  if (Number.isNaN(itemId)) {
    resp.status(400).json({ error: 'Invalid item ID' });
    return;
  }

  const item = await prisma.item.findUnique({
    where: { itemId },
    include: {
      supplier: true,
      purchaseOrders: true,
      scanRecords: true,
      rfidTag: true,
    },
  });

  if (!item) {
    resp.status(404).json({ error: 'Item not found' });
    return;
  }

  resp.json(item);
};

export const updateItem = async (req: Request, resp: Response) => {
  const itemId = Number(req.params.id);
  if (Number.isNaN(itemId)) {
    resp.status(400).json({ error: 'Invalid item ID' });
    return;
  }

  const { itemname, sku, quantity, minStock, supplierId, rfidCode } = req.body;
  const item = await prisma.item.update({
    where: { itemId },
    data: {
      itemname,
      sku,
      quantity,
      minStock,
      supplierId,
      rfidCode,
    },
  });

  resp.json(item);
};

export const deleteItem = async (req: Request, resp: Response) => {
  const itemId = Number(req.params.id);
  if (Number.isNaN(itemId)) {
    resp.status(400).json({ error: 'Invalid item ID' });
    return;
  }

  await prisma.item.delete({
    where: { itemId },
  });

  resp.json({ message: 'Item deleted successfully' });
};
