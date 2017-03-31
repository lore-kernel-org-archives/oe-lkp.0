Content-Type: multipart/mixed; boundary="===============1690807378434875844=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [x86] ab684b7bee: Kernel_panic-not_syncing:No_working_init_found
Date: Fri, 31 Mar 2017 01:50:48 +0100
Message-ID: <20170331005048.GY29622@ZenIV.linux.org.uk>
In-Reply-To: <20170331004255.GA46935@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1690807378434875844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2017 at 08:42:56AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> commit: ab684b7beeaeedf27db9929bd0c3687dc8140381 ("x86: switch to RAW_COP=
Y_USER")
> git://internal_merge_and_test_tree devel-catchup-201703261050
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/

Long since not in the tree, actually.  The bug had been in ancestor of
that commit (3fa08992e9c) and it got fixed before the last rebase of
uaccess.stem (18:22 Mar 28).

--===============1690807378434875844==--

