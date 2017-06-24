Content-Type: multipart/mixed; boundary="===============5501750915308258043=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 1/3] xattr: Enable security.capability in user namespaces
Date: Sun, 25 Jun 2017 05:02:24 +0800
Message-ID: <201706250409.PFosMVWz%fengguang.wu@intel.com>
In-Reply-To: <1498157989-11814-2-git-send-email-stefanb@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5501750915308258043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

[auto build test WARNING on linus/master]
[also build test WARNING on v4.12-rc6 next-20170623]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp improve the system]

url:    https://github.com/0day-ci/linux/commits/Stefan-Berger/Enable-names=
paced-file-capabilities/20170625-001722


coccinelle warnings: (new ones prefixed by >>)

>> fs/xattr.c:516:10-17: WARNING opportunity for kstrdep (strcpy on line 51=
9)

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/kbuild-all                   Intel Corporati=
on

--===============5501750915308258043==--

