Content-Type: multipart/mixed; boundary="===============7847472343700162273=="
MIME-Version: 1.0
From: Anand Jain <anand.jain@oracle.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] 164a91c9be: xfstests.generic.088.fail
Date: Tue, 21 Jun 2016 18:25:00 +0800
Message-ID: <ddb71dd7-5e57-ab7c-a433-f8ea7a12ed6a@oracle.com>
In-Reply-To: <20160621021143.GC25382@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7847472343700162273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



Thanks for the report.

 > _check_btrfs_filesystem: filesystem on /dev/sda5 is inconsistent (see =

/lkp/benchmarks/xfstests/results//check.full)
 > generic/088	 0s

Ran tests again unfortunately I couldn't reproduce..
---------
generic/088 0s ... 0s
generic/089 21s ... 39s
generic/090 4s ... 4s
generic/091 58s ... 58s
generic/092 1s ... 0s
generic/096	 [not run] xfs_io fzero failed (old kernel/wrong fs?)
generic/098 2s ... 2s
generic/100 18s ... 18s
generic/101	 3s
generic/102	 8s
generic/103	 2s
----------

But a possible scenario .. in systems where rcu_callback itself
could be deferred it needs rcu_barrier(). Fixed this in V2, by
restoring rcu_barrier() and then grace period wait for devices
to close.


>     +mount: /dev/sda6 is already mounted or /fs/scratch busy
::
>     +umount: /dev/sda6: not mounted

This might be different issue, when this happens generally
wipefs all scratch pool devices helps.


Thanks, Anand




--===============7847472343700162273==--

