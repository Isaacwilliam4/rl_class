eval "$(conda shell.bash hook)"

conda create -n doom_env python=3.11.13 -y
conda activate doom_env

pip install sample-factory vizdoom ipywidgets notebook

mod_file_path="$HOME/miniconda3/envs/doom_env/lib/python3.11/site-packages/sample_factory/algo/learning/learner.py"

sed -i 's|checkpoint_dict = torch.load(latest_checkpoint, map_location=device)|checkpoint_dict = torch.load(latest_checkpoint, map_location=device, weights_only=False)|' $mod_file_path

