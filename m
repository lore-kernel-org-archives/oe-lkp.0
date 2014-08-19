Content-Type: multipart/mixed; boundary="===============4635160140472464547=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [btrfs] 8d875f95: xfstests.generic.226.fail
Date: Tue, 19 Aug 2014 19:58:20 +0800
Message-ID: <20140819115820.GA21418@localhost>
In-Reply-To: <20140816075233.GA26842@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============4635160140472464547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Chris,

We noticed an xfstests failure on commit

8d875f95da43c6a8f18f77869f2ef26e9594fecc ("btrfs: disable strict file flush=
es for renames and truncates")

It's 100% reproducible in the 5 test runs.

test case: snb-drag/xfstests/4HDD-btrfs-generic-mid

27b9a8122ff71a8  8d875f95da43c6a8f18f77869
---------------  -------------------------
                    %change               %stddev
                       |                 /
         0           +Inf%          1 =C2=B1 0%  TOTAL xfstests.generic.226=
.fail

Thanks,
Fengguang

--===============4635160140472464547==--

