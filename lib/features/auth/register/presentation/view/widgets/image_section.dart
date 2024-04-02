import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_cubit.dart';
import 'package:barter_app/features/auth/register/presentation/veiw_model/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => context.read<RegisterCubit>().selectImage(),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: context.read<RegisterCubit>().imageFile != null
                    ? FileImage(context.read<RegisterCubit>().imageFile!)
                    : null,
                child: context.read<RegisterCubit>().imageFile == null
                    ? const Icon(
                        Icons.camera_alt,
                        size: 80,
                      )
                    : null,
              ),
              if (context.read<RegisterCubit>().imageFile != null)
                IconButton(
                    onPressed: () {
                      context.read<RegisterCubit>().removeImage();
                    },
                    icon: const Icon(
                      Icons.delete_rounded,
                      size: 30,
                      color: Colors.blue,
                    ))
            ],
          ),
        );
      },
    );
  }
}
