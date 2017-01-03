Content-Type: multipart/mixed; boundary="===============2372432086215571921=="
MIME-Version: 1.0
From: Matthew Wilcox <mawilcox@microsoft.com>
To: lkp@lists.01.org
Subject: Re: [lkp-developer] c55a9697e1: BUG:KASAN:null-ptr-deref_on_address(null)
Date: Tue, 03 Jan 2017 17:57:09 +0000
Message-ID: <BY2PR21MB00360AD7A0B45D7706B82B06CB6E0@BY2PR21MB0036.namprd21.prod.outlook.com>
In-Reply-To: <20170103080339.GA14390@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2372432086215571921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: lkp-developer-request(a)eclists.intel.com [mailto:lkp-developer-reque=
st(a)eclists.intel.com] On Behalf Of kernel test robot
> FYI, we noticed the following commit:
> =

> commit: c55a9697e10aba9946692c56e9236993c1da023a ("Reimplement IDR
> and IDA using the radix tree")
> git://git.infradead.org/users/willy/linux-dax.git idr-2016-12-26
> caused below changes:
> =

> +-------------------------------------------+------------+------------+
> |                                           | ef9e389452 | c55a9697e1 |
> +-------------------------------------------+------------+------------+
> | BUG:KASAN:null-ptr-deref_on_address(null) | 0          | 20         |
> | BUG:unable_to_handle_kernel               | 0          | 20         |
> | Oops                                      | 0          | 20         |
> | Kernel_panic-not_syncing:Fatal_exception  | 0          | 20         |
> +-------------------------------------------+------------+------------+

Thank you!  Bug diagnosed, test-case written, test case verified to fail fo=
r the c55a9 commit, bug squashed, test case verified to pass, new branch pu=
shed out to idr-2016-01-03.

(in case anybody cares, the bug was that removing a NULL entry from index 0=
 of an IDR with one entry in it caused a NULL pointer dereference when we c=
hecked node->shift without first checking that node wasn't NULL.  This was =
a half-hearted attempt at an optimization, so I deleted that clause of the =
if statement.  That exposed an unrelated bug in get_node_tag() which had th=
e sense of the condition wrong).

--===============2372432086215571921==--

