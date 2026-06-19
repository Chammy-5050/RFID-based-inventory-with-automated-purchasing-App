import { Router } from 'express';
import {
  createRFIDTag,
  getAllRFIDTags,
  getRFIDTagById,
  updateRFIDTag,
  deleteRFIDTag,
} from '../controllers/tag_controller/tag_controller.ts';

const router = Router();

router.post('/rfid', createRFIDTag);
router.get('/', getAllRFIDTags);
router.get('/:id', getRFIDTagById);
router.put('/:id', updateRFIDTag);
router.delete('/:id', deleteRFIDTag);

export default router;
