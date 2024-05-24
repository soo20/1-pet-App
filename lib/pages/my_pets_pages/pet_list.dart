/*class PetsListScreen extends StatelessWidget {
  const PetsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pets'),
      ),
      body: FutureBuilder<List<PetsInformation>>(
        future: fetchUserPets(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No pets found'));
          } else {
            List<PetsInformation> petsList = snapshot.data!;
            return ListView.builder(
              itemCount: petsList.length,
              itemBuilder: (context, index) {
                PetsInformation pet = petsList[index];
                return ListTile(
                  title: Text(pet.petName),
                  subtitle: Text('Type: ${pet.petType}, Age: ${pet.age}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
*/



