Content-Type: multipart/mixed; boundary="===============3953226654733825764=="
MIME-Version: 1.0
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: lkp@lists.01.org
Subject: Re: [init/initramfs.c] e7cb072eb9: invoked_oom-killer:gfp_mask=0x
Date: Fri, 11 Jun 2021 23:08:25 +0200
Message-ID: <729130e8-1e2e-ba79-5c4a-5156ac6d64be@rasmusvillemoes.dk>
In-Reply-To: <20210611152959.GA29971@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3953226654733825764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/06/2021 17.29, Oliver Sang wrote:
> hi Rasmus,
> =

> On Fri, Jun 11, 2021 at 11:20:18AM +0200, Rasmus Villemoes wrote:
>> OK. It's really odd that providing the VM with _more_ memory makes it
>> fail (other then the obvious failure in the other direction when there's
>> simply not enough memory for the unpacked initramfs itself). But
>> unfortunately that also sounds like I won't be able to reproduce with
>> the HW I have.
>>
>>>> As an extra data point, what happens if you add initramfs_async=3D0 to=
 the
>>>> command line?
>>>
>>> yes, we tested this before sending out the report. the issue gone
>>> if initramfs_async=3D0 is added.
>>
>> Hm. Sounds like some initcall after rootfs_initcall time must
>> allocate/hog a lot of memory, perhaps with some heuristic depending on
>> how much is available.
>>
>> Can you try with initcall_debug=3D1? I think that should produce a lot of
>> output, hopefully that would make it possible to see which initcalls
>> have been done just prior to (or while) the initramfs unpacking hits ENO=
MEM.
> =

> thanks a lot for guidance!
> =

> by several jobs with initcall_debug=3D1, the oom happens consistently aft=
er
> "calling  panel_init_module"
> =

> below is an example, and detail dmesg.xz attached:

Interesting. Well, I'm not sure panel_init_module has anything to do
with it; there is an almost five second gap until the OOM hits. So my
_guess_ is that we're just hitting

panel_init_module ->
parport_register_driver (macro wrapper for __parport_register_driver) ->
get_lowlevel_driver ->
request_module ->
...
wait_for_initramfs

which is why there's no more output from PID1. But just in case, can you
try disabling CONFIG_PARPORT_PANEL and see if you still hit the OOM?

It's not clear where all the memory goes. Is there any way to print some
memory statistics after each initcall?

You said that it was consistent, so perhaps something like this ugly
hack could be used to "bisect" to see which other initcall(s) we have a
bad interaction with:

diff --git a/init/initramfs.c b/init/initramfs.c
index af27abc59643..2386057f1faa 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -732,3 +732,19 @@ static int __init populate_rootfs(void)
        return 0;
 }
 rootfs_initcall(populate_rootfs);
+
+static unsigned count;
+static int __init hack_setup(char *str)
+{
+       count =3D simple_strtoul(str, NULL, 0);
+       return 1;
+}
+__setup("hack=3D", hack_setup);
+
+void hack(void)
+{
+       if (!initramfs_cookie || !count)
+               return;
+       if (!--count)
+               wait_for_initramfs();
+}
diff --git a/init/main.c b/init/main.c
index e9c42a183e33..a96367080011 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1236,6 +1236,7 @@ static inline void
do_trace_initcall_finish(initcall_t fn, int ret)
 }
 #endif /* !TRACEPOINTS_ENABLED */

+extern void hack(void);
 int __init_or_module do_one_initcall(initcall_t fn)
 {
        int count =3D preempt_count();
@@ -1248,6 +1249,7 @@ int __init_or_module do_one_initcall(initcall_t fn)
        do_trace_initcall_start(fn);
        ret =3D fn();
        do_trace_initcall_finish(fn, ret);
+       hack();

        msgbuf[0] =3D 0;

(compile-tested only). By my count, there are 322 initcalls from
populate_rootfs() to panel_init_module() inclusive. Booting with hack=3D1
should be equivalent to initramfs_async=3D0 and hence succeed, and
hack=3D322 should make you see the above behaviour.


Rasmus
--===============3953226654733825764==--

