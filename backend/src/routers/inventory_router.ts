import { Router } from 'express';
import {
  createItem,
  getAllItems,
  getItemById,
  updateItem,
  adjustItemQuantity,
  deleteItem,
} from '../controllers/inventory_controller/inventory_controller.ts';

const router = Router();

router.post('/', createItem);
router.get('/', getAllItems);
router.get('/:id', getItemById);
router.put('/:id', updateItem);
router.patch('/:id/quantity', adjustItemQuantity);
router.delete('/:id', deleteItem);

export default router;
