Content-Type: multipart/mixed; boundary="===============2388947293970263030=="
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: lkp@lists.01.org
Subject: Re: [of] 649e0a77e28:
Date: Mon, 13 Jul 2015 22:31:11 -0500
Message-ID: <CAL_JsqLRrh_mQCsqv9paZgmYnzMcH=jNnnVQt-Wgr0yJ17sYow@mail.gmail.com>
In-Reply-To: <1436841447.5489.462.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2388947293970263030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2015 at 9:37 PM, Huang Ying <ying.huang@intel.com> wrote:
> FYI, we noticed the below changes on
>
> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 649e0a77e28a7796bf62bfda0fe3f2aee094bd58 ("of: make unittest selec=
t OF_EARLY_FLATTREE instead of depend on it")
>
> The following new message in kernel log may make end user confuse.
>
> [    2.775617] device-tree: Duplicate name in testcase-data, renamed to "=
duplicate-name#1"

This should probably be after the next line.

> [    2.779463] ### dt-test ### start of unittest - you will see error mes=
sages

Is "you will see error messages" not clear enough?

We could prefix every message to make it clearer. Unit tests often
print error messages and typically should not be enabled on production
kernels.

Rob

> [    2.780294] /testcase-data/phandle-tests/consumer-a: could not get #ph=
andle-cells-missing for /testcase-data/phandle-tests/provider1
> [    2.781341] /testcase-data/phandle-tests/consumer-a: could not get #ph=
andle-cells-missing for /testcase-data/phandle-tests/provider1
> [    2.782394] /testcase-data/phandle-tests/consumer-a: could not find ph=
andle
> [    2.783001] /testcase-data/phandle-tests/consumer-a: could not find ph=
andle
> [    2.783622] /testcase-data/phandle-tests/consumer-a: arguments longer =
than property
> [    2.784333] /testcase-data/phandle-tests/consumer-a: arguments longer =
than property
>
>
> Thanks,
> Ying Huang

--===============2388947293970263030==--

