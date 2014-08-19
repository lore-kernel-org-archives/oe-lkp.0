Content-Type: multipart/mixed; boundary="===============4815760540687306406=="
MIME-Version: 1.0
From: David Sterba <dsterba@suse.cz>
To: lkp@lists.01.org
Subject: Re: [btrfs] 8d875f95: xfstests.generic.226.fail
Date: Tue, 19 Aug 2014 16:23:48 +0200
Message-ID: <20140819142348.GU1553@twin.jikos.cz>
In-Reply-To: <20140819115820.GA21418@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============4815760540687306406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2014 at 07:58:20PM +0800, Fengguang Wu wrote:
> We noticed an xfstests failure on commit
> =

> 8d875f95da43c6a8f18f77869f2ef26e9594fecc ("btrfs: disable strict file flu=
shes for renames and truncates")
> =

> It's 100% reproducible in the 5 test runs.

Same here, different mkfs configurations.

generic/226 28s ...    [16:11:52] [16:12:55] - output mismatch (see /root/x=
fstests/results//generic/226.out.bad)
    --- tests/generic/226.out   2013-05-29 17:16:03.000000000 +0200
    +++ /root/xfstests/results//generic/226.out.bad     2014-08-19 16:12:55=
.000000000 +0200
    @@ -1,6 +1,8 @@
     QA output created by 226
     --> mkfs 256m filesystem
     --> 16 buffered 64m writes in a loop
    -1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
    +1 2 3 4 pwrite64: No space left on device
    +5 6 7 8 9 10 11 12 pwrite64: No space left on device
    +13 14 15 16

enospc on a small filesystem (256M)

# btrfs fi df /mnt/a2
System, single: total=3D4.00MiB, used=3D4.00KiB
Data+Metadata, single: total=3D252.00MiB, used=3D31.09MiB
GlobalReserve, single: total=3D4.00MiB, used=3D0.00B

$ df -h /mnt/a2
Filesystem            Size  Used Avail Use% Mounted on
/dev/sda9             256M   16M  241M   6% /mnt/a2

--===============4815760540687306406==--

