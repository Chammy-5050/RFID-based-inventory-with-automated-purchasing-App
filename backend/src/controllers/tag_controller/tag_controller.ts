import type { Request, Response } from 'express';
import { prisma } from '../../prisma.ts';

export const createRFIDTag = async (req: Request, resp: Response) => {
  const { itemId, itemname, quantity, tagCode } = req.body;
  const tag = await prisma.rFIDTag.create({
    data: {
      itemId,
      itemname,
      quantity,
      tagCode,
    },
  });
  resp.json(tag);
};

export const getAllRFIDTags = async (req: Request, resp: Response) => {
  const tags = await prisma.rFIDTag.findMany({
    include: {
      item: true,
    },
  });
  resp.json(tags);
};

export const getRFIDTagById = async (req: Request, resp: Response) => {
  const itemId = Number(req.params.id);
  if (Number.isNaN(itemId)) {
    resp.status(400).json({ error: 'Invalid item ID' });
    return;
  }

  const tag = await prisma.rFIDTag.findUnique({
    where: { itemId },
    include: {
      item: true,
    },
  });

  if (!tag) {
    resp.status(404).json({ error: 'RFID tag not found' });
    return;
  }

  resp.json(tag);
};

export const updateRFIDTag = async (req: Request, resp: Response) => {
  const itemId = Number(req.params.id);
  if (Number.isNaN(itemId)) {
    resp.status(400).json({ error: 'Invalid item ID' });
    return;
  }

  const { itemname, quantity, tagCode } = req.body;
  const tag = await prisma.rFIDTag.update({
    where: { itemId },
    data: {
      itemname,
      quantity,
      tagCode,
    },
  });

  resp.json(tag);
};

export const deleteRFIDTag = async (req: Request, resp: Response) => {
  const itemId = Number(req.params.id);
  if (Number.isNaN(itemId)) {
    resp.status(400).json({ error: 'Invalid item ID' });
    return;
  }

  await prisma.rFIDTag.delete({
    where: { itemId },
  });

  resp.json({ message: 'RFID tag deleted successfully' });
};
