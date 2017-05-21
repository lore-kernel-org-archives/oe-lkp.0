Content-Type: multipart/mixed; boundary="===============0669778381810901117=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [waitid()] 75f64d68f9: Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=
Date: Sun, 21 May 2017 15:19:57 -0700
Message-ID: <CA+55aFyoDW8-VA2R7Ay6SJ9Vf7kJfuzEMBZ5JQfbTn-9Ab7Quw@mail.gmail.com>
In-Reply-To: <CA+55aFzeNvdu1E0VrmZ=p8eJL-vZ4no-qJ=PaBaBg0JLAMSsFg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0669778381810901117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 21, 2017 at 2:37 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I'm pretty sure there's a reason we added support for it on x86-32,
> because there are structures that use __u64 and fill things one entry
> at a time.

Did an "allyesconfig" build on 32-bit x86, and looked at who uses the
8-byte get_user/put_user cases:

__get_user_8:
    i915_perf_open_ioctl

__put_user_8:
    snapshot_ioctl
    sys_sendfile64
    timerfd_read
    eventfd_read
    userfaultfd_ioctl
    kpagecgroup_read
    kpagecount_read
    kpageflags_read
    __ncp_ioctl
    blkdev_ioctl
    drm_mode_object_get_properties
    drm_mode_getproperty_ioctl
    efi_test_ioctl
    params_to_user
    __rds_rdma_map

so it's not common, but both do get used.

Would any of those be changed to the unsafe versions? Maybe not. But I
think we're better off being consistent.

We basically allow all kernel integer types to be used for
put/get_user(), and the fact that some architectures don't support
them is just a quirk of that architecture, not a sign that it
shouldn't be done.

                  Linus

--===============0669778381810901117==--

