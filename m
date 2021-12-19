Content-Type: multipart/mixed; boundary="===============5905160115193224286=="
MIME-Version: 1.0
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To: lkp@lists.01.org
Subject: Re: [loop] 322c4293ec: xfstests.xfs.049.fail
Date: Mon, 20 Dec 2021 00:45:46 +0900
Message-ID: <dd707dfd-6421-b1df-4820-e30787b84181@i-love.sakura.ne.jp>
In-Reply-To: <20211219150933.GJ14057@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5905160115193224286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021/12/20 0:09, kernel test robot wrote:
>     @@ -13,3 +13,5 @@
>      --- clean
>      --- umount ext2 on xfs
>      --- umount xfs
>     +!!! umount xfs failed
>     +(see /lkp/benchmarks/xfstests/results//xfs/049.full for details)
>     ...
>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/xfs/049.out /lkp/benchma=
rks/xfstests/results//xfs/049.out.bad'  to see the entire diff)

Yes, we know this race condition can happen.

https://lkml.kernel.org/r/16c7d304-60ef-103f-1b2c-8592b48f47c6(a)i-love.sak=
ura.ne.jp
https://lkml.kernel.org/r/YaYfu0H2k0PSQL6W(a)infradead.org

Should we try to wait for autoclear operation to complete?

--===============5905160115193224286==--

