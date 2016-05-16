Content-Type: multipart/mixed; boundary="===============4057388796086903802=="
MIME-Version: 1.0
From: Eric Sandeen <sandeen@sandeen.net>
To: lkp@lists.01.org
Subject: Re: [xfs] a08ee40a79: kmsg.XFS(vdd):unknown_mount_option[nosuchopt]
Date: Mon, 16 May 2016 10:46:04 -0500
Message-ID: <8b490c2a-505d-bba2-c4a9-b85732505dc5@sandeen.net>
In-Reply-To: <20160516014233.GA18460@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4057388796086903802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/15/16 8:42 PM, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit a08ee40a79653d082911cab9fbeff94baa7714cb ("xfs: sanitize remount o=
ptions")
> =

> on test machine: vm-kbuild-4G: 4 threads qemu-system-x86_64 -enable-kvm -=
cpu qemu64,+ssse3 with 4G memory
> =

> caused below changes:
> =

> =

> [  666.729855] XFS (vdd): unknown mount option [nosuchopt].

This is expected, it's just that we're catching invalid remount options, no=
w,
and being a bit noiser about it.

                default:
                        xfs_warn(mp, "unknown mount option [%s].", p);
                        return -EINVAL;

>From tests/generic/082 :

# first remount ro with a bad option, a failed remount ro should not disable
# quota, but currently xfs doesn't fail in this case, the unknown option is
# just ignored, but quota is still on. This may change in future, let's
# re-consider the case then.
_scratch_mount "-o remount,ro,nosuchopt" >>$seqres.full 2>&1

so the test is intentionally passing in a bad mount option, and the kernel
is just letting us know.

Thanks,
-Eric


--===============4057388796086903802==--

