using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class subir : MonoBehaviour
{
    public GameObject mutacao;
    private float countdown = 0.5f;
    
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {

       

        if (Input.anyKeyDown)
        {
            transform.Rotate(new Vector3(Random.Range(10, 60), Random.Range(10, 60), Random.Range(10, 60)));
            mutacao.SetActive(true);

            countdown -= Time.deltaTime;
            if (countdown <= 0.0f)// zera contador e mostra palavra Mutacao
            {
                countdown = 0.5f;
                mutacao.SetActive(false);

            }

        }
        else
        {
            countdown -= Time.deltaTime;
            if (countdown <= 0.0f)// zera contador e esconde palavra mutacao
            {
                countdown = 0.5f;
                mutacao.SetActive(false);
                
            }
        }

    }


}
