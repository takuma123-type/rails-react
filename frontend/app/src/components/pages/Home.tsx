import React, { useContext } from "react"
import { AuthContext } from "App"

const Home: React.FC = () => {
  const { isSignedIn, currentUser } = useContext(AuthContext)

  return (
    <>
      {
        isSignedIn && currentUser ? (
          <>
            <h1>ログイン成功</h1>
            <h2>Name: {currentUser?.name}</h2>
          </>
        ) : (
          <h1>ログインできないよ</h1>
        )
      }
    </>
  )
}

export default Home