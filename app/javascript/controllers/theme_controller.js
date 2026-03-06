import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="theme"
export default class extends Controller {
  static targets = ["button"]
  connect() {
    console.log(localStorage.getItem('isdark'));
    const state = JSON.parse(localStorage.getItem('isdark'))
    this.buttonTarget.checked = state
  }

  changeTheme() {
    localStorage.setItem('isdark', this.buttonTarget.checked)
  }
}

// export default function App() {
//   const [isdark, setIsdark] = useState(
//     JSON.parse(localStorage.getItem('isdark'))
//   );
//   useEffect(() => {
//     localStorage.setItem('isdark', JSON.stringify(isdark));
//   }, [isdark]);
//   return (
//     <>
//       <input
//         type="checkbox"
//         checked={isdark}
//         onChange={() => setIsdark(!isdark)}
//       />
//       The value of this checkbox gets saved on browser localStorage
//     </>
//   );
// }
