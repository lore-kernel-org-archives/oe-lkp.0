Content-Type: multipart/mixed; boundary="===============6602915556670827481=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: lkp@lists.01.org
Subject: Re: [ARM] d250e1290c: WARNING:at_include/linux/thread_info.h:#do_semtimedop
Date: Mon, 07 Sep 2020 12:48:19 +0200
Message-ID: <CAK8P3a14RG9Vmqn6JDRp_0Xeb=UQOMEQO2UAQhsj=0skD=nNwA@mail.gmail.com>
In-Reply-To: <20200907084637.GK31308@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6602915556670827481==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2020 at 10:47 AM kernel test robot <rong.a.chen@intel.com>=
 wrote:
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: d250e1290cc53cbe59e259053543dfdbf3de5681 ("ARM: oabi-compat: rewo=
rk sys_semtimedop emulation")
> https://git.kernel.org/cgit/linux/kernel/git/arnd/playground.git arm-kill=
-set_fs
>
>
> in testcase: trinity
> version:
> with following parameters:
>
>         runtime: 300s
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/

Thanks a lot for the report, it's very helpful!

The problem is fairly harmless, which I think is good as this means
the patch series survived a minor beating without anything else going
wrong.

The problems I did introduce only happen with overly large 'nsops'
arguments that lead to the allocation failure warning as well as returning
-ENOMEM instead of -E2BIG.

I'll reorder the code to make it behave like before, something like:

diff --git a/arch/arm/kernel/sys_oabi-compat.c
b/arch/arm/kernel/sys_oabi-compat.c
index cc0b1d0aa1ed..98e7b2a62b09 100644
--- a/arch/arm/kernel/sys_oabi-compat.c
+++ b/arch/arm/kernel/sys_oabi-compat.c
@@ -320,15 +320,21 @@ struct oabi_sembuf {
        unsigned short  __pad;
 };

+#define sc_semopm     sem_ctls[2]
+
 asmlinkage long sys_oabi_semtimedop(int semid,
                                    struct oabi_sembuf __user *tsops,
                                    unsigned nsops,
                                    const struct old_timespec32 __user *tim=
eout)
 {
+       struct ipc_namespace *ns;
        struct sembuf *sops;
        long err;
        int i;

+       ns =3D current->nsproxy->ipc_ns;
+       if (nsops > ns->sc_semopm)
+               return -E2BIG;
        if (nsops < 1 || nsops > SEMOPM)
                return -EINVAL;
        sops =3D kvmalloc_array(nsops, sizeof(*sops), GFP_KERNEL);
@@ -353,7 +359,7 @@ asmlinkage long sys_oabi_semtimedop(int semid,
                err =3D get_old_timespec32(&ts, timeout);
                if (err)
                        goto out;
-               err =3D __do_semtimedop(semid, sops, nsops, &ts);
+               err =3D __do_semtimedop(semid, sops, nsops, &ts, ns);
                goto out;
        }
        err =3D __do_semtimedop(semid, sops, nsops, NULL);
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 2a082c34b7a3..c77bd4cce536 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -1341,7 +1341,7 @@ long compat_ksys_semtimedop(int semid, struct
sembuf __user *tsems,
                            unsigned int nsops,
                            const struct old_timespec32 __user *timeout);
 long __do_semtimedop(int semid, struct sembuf *tsems, unsigned int nsops,
-                    const struct timespec64 *timeout);
+                    const struct timespec64 *timeout, struct
ipc_namespace *ns);

 int __sys_getsockopt(int fd, int level, int optname, char __user *optval,
                int __user *optlen);
diff --git a/ipc/sem.c b/ipc/sem.c
index e145f04b8b44..515a39a67534 100644
--- a/ipc/sem.c
+++ b/ipc/sem.c
@@ -1979,7 +1979,8 @@ static struct sem_undo *find_alloc_undo(struct
ipc_namespace *ns, int semid)
 }

 long __do_semtimedop(int semid, struct sembuf *sops,
-               unsigned nsops, const struct timespec64 *timeout)
+               unsigned nsops, const struct timespec64 *timeout,
+               struct ipc_namespace *ns)
 {
        int error =3D -EINVAL;
        struct sem_array *sma;
@@ -1989,9 +1990,6 @@ long __do_semtimedop(int semid, struct sembuf *sops,
        bool undos =3D false, alter =3D false, dupsop =3D false;
        struct sem_queue queue;
        unsigned long dup =3D 0, jiffies_left =3D 0;
-       struct ipc_namespace *ns;
-
-       ns =3D current->nsproxy->ipc_ns;

        if (nsops < 1 || semid < 0)
                return -EINVAL;
@@ -2224,8 +2222,12 @@ static long do_semtimedop(int semid, struct
sembuf __user *tsops,
 {
        struct sembuf fast_sops[SEMOPM_FAST];
        struct sembuf *sops =3D fast_sops;
+       struct ipc_namespace *ns;
        int ret;

+       ns =3D current->nsproxy->ipc_ns;
+       if (nsops > ns->sc_semopm)
+               return -E2BIG;
        if (nsops < 1)
                return -EINVAL;

@@ -2240,7 +2242,7 @@ static long do_semtimedop(int semid, struct
sembuf __user *tsops,
                goto out_free;
        }

-       ret =3D __do_semtimedop(semid, sops, nsops, timeout);
+       ret =3D __do_semtimedop(semid, sops, nsops, timeout, ns);

 out_free:
        if (sops !=3D fast_sops)
--===============6602915556670827481==--

