Content-Type: multipart/mixed; boundary="===============0575900658607154199=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Tips to append base tree info by git-format-patch
Date: Fri, 23 Sep 2016 22:36:37 +0800
Message-ID: <20160923143637.GA11833@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0575900658607154199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Here's a tip for people who've been bothered by messages sent by kbuild bot=
 like
below: =


[auto build test ERROR on net/master]
[also build test ERROR on v4.8-rc3 next-20160825]
[if your patch is applied to the wrong git tree, please drop us a note
to help improve the system]

It means that 0day bot applied the patch to net/master which is obtained ba=
sed
on heuristic (0day bot does a guess job based on the MAINTAINERS file in li=
nux
src to get the tree/branch ). It can't guarantee 100% accuracy. =


To avoid false reports which is caused by 0day apply your patches to a wrong
tree, we suggest to use the new option --base which is introduced since git
2.9.0 to append the base tree info, here is a example of it: =


Imagine that on top of the public commit P, you applied well-known
(on-flight) patches X, Y and Z from somebody else or yourself, and then bui=
lt
your three-patch series A, B, C, the history would be like:

................................................
---P---X---Y---Z---A---B---C
................................................

With `git format-patch --base=3DP -3 C`, =


where P could be the exact commit sha, or variants e.g. HEAD~6, you can als=
o use
--base=3Dauto for convenience, the base tree information block is shown at =
the
end of the first message the command outputs (either the first patch, or the
cover letter), like this:

------------
base-commit: P
prerequisite-patch-id: X
prerequisite-patch-id: Y
prerequisite-patch-id: Z
------------

For more information, please refer to: https://git-scm.com/docs/git-format-=
patch

We'll be appreciated if you could use this option if you'd like your patch
series to be verified by 0day on a solid base as yours.

Feedbacks are welcome! Please drop us a mail if you have any suggestions.

Thanks,
Xiaolong

--===============0575900658607154199==--

