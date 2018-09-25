Content-Type: multipart/mixed; boundary="===============5458261401217400237=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: lkp@lists.01.org
Subject: Re: [PATCH] ipc/shm: properly return EIDRM in shm_lock()
Date: Tue, 25 Sep 2018 14:00:03 +0200
Message-ID: <CAK8P3a3TMUbqLtde-wJyvF+H31VTPQwCKCqPjf41dwGMK-vbQg@mail.gmail.com>
In-Reply-To: <20180824030920.GD3677@linux-r8p5>
List-Id: <oe-lkp.lists.linux.dev>

--===============5458261401217400237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2018 at 5:09 AM Davidlohr Bueso <dave@stgolabs.net> wrote:
>
> When getting rid of the general ipc_lock(), this was missed
> furthermore, making the comment around the ipc object validity
> check bogus. Under EIDRM conditions, callers will in turn not
> see the error and continue with the operation.
>
> Fixes: 82061c57ce9 (ipc: drop ipc_lock())
> Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
> ---

Oddly, this change introduces a gcc warning in some configurations
(i.e. with randstruct enabled):

ipc/shm.c: In function 'shm_lock':
ipc/shm.c:209:9: note: randstruct: casting between randomized
structure pointer types (ssa): 'struct shmid_kernel' and 'struct
kern_ipc_perm'
  return (void *)ipcp;
         ^~~~~~~~~~~~

Not sure why we didn't see that warning before, probably
it ended up making its own thing when the return code
was uninitialized.

The change below gets rid of the warning, but is a bit ugly.

       Arnd

diff --git a/ipc/shm.c b/ipc/shm.c
index fe3c42e66a48..922012a745e5 100644
--- a/ipc/shm.c
+++ b/ipc/shm.c
@@ -180,10 +180,12 @@ static inline struct shmid_kernel
*shm_obtain_object_check(struct ipc_namespace
 static inline struct shmid_kernel *shm_lock(struct ipc_namespace *ns, int =
id)
 {
        struct kern_ipc_perm *ipcp;
+       int ret;

        rcu_read_lock();
        ipcp =3D ipc_obtain_object_idr(&shm_ids(ns), id);
-       if (IS_ERR(ipcp))
+       ret =3D PTR_ERR_OR_ZERO(ipcp);
+       if (ret)
                goto err;

        ipc_lock_object(ipcp);
@@ -199,14 +201,14 @@ static inline struct shmid_kernel
*shm_lock(struct ipc_namespace *ns, int id)
        }

        ipc_unlock_object(ipcp);
-       ipcp =3D ERR_PTR(-EIDRM);
+       ret =3D -EIDRM;
 err:
        rcu_read_unlock();
        /*
         * Callers of shm_lock() must validate the status of the returned i=
pc
         * object pointer and error out as appropriate.
         */
-       return (void *)ipcp;
+       return ERR_PTR(ret);
 }

 static inline void shm_lock_by_ptr(struct shmid_kernel *ipcp)

--===============5458261401217400237==--

