Content-Type: multipart/mixed; boundary="===============7688376277689064498=="
MIME-Version: 1.0
From: Davidlohr Bueso <dave@stgolabs.net>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [ipc] 296ba26b66: BUG:sleeping_function_called_from_invalid_context_at_mm/memory.c
Date: Wed, 22 Aug 2018 21:14:34 -0700
Message-ID: <20180823041434.GC3677@linux-r8p5>
In-Reply-To: <20180823024051.GC13343@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7688376277689064498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Aug 2018, kernel test robot wrote:

>FYI, we noticed the following commit (built with gcc-7):
>
>commit: 296ba26b6681b6e07ed419b3004647167cb17f61 ("ipc: drop ipc_lock()")
>https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

I suspect this is because that commit forgot to set EIDRM for the
!ipc_valid_object() case. So the callers check IS_ERR(shm_lock()),
which won't fail the op as it did before the commit.

diff --git a/ipc/shm.c b/ipc/shm.c
index b0eb3757ab89..4cd402e4cfeb 100644
--- a/ipc/shm.c
+++ b/ipc/shm.c
@@ -199,6 +199,7 @@ static inline struct shmid_kernel *shm_lock(struct ipc_=
namespace *ns, int id)
 	}
 =

 	ipc_unlock_object(ipcp);
+	ipcp =3D ERR_PTR(-EIDRM);
 err:
 	rcu_read_unlock();
 	/*

--===============7688376277689064498==--

