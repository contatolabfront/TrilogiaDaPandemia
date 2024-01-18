using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class setRotation : MonoBehaviour
{
    public GameObject palavra;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }


    void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "cubo")
            //transform.Rotate(new Vector3(0.0f, 0.0f, 0.0f));
            palavra.transform.rotation = Quaternion.Euler(0, 0, 0);
    }

}
