Content-Type: multipart/mixed; boundary="===============4339391767006470739=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [pipe] f2af7d90e2: xfstests.btrfs.052.fail
Date: Sun, 10 May 2020 18:16:01 -0700
Message-ID: <20200511011601.GV16070@bombadil.infradead.org>
In-Reply-To: <20200511010957.GW5770@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4339391767006470739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2020 at 09:09:57AM +0800, kernel test robot wrote:
>     --- tests/btrfs/095.out	2020-04-09 10:45:28.000000000 +0800
>     +++ /lkp/benchmarks/xfstests/results//btrfs/095.out.bad	2020-05-06 21=
:13:51.276485703 +0800
>     @@ -1,35 +1,9 @@
>      QA output created by 095
>     -Blocks modified: [135 - 164]
>     -Blocks modified: [768 - 792]
>     +awk: line 19: function strtonum never defined
>     +awk: line 19: function strtonum never defined
>     +awk: line 19: function strtonum never defined
>     +awk: line 19: function strtonum never defined

This looks like a problem with the test setup.

--===============4339391767006470739==--

