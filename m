Content-Type: multipart/mixed; boundary="===============8823869998302191075=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [SUNRPC] 0472e47660: fsmark.app_overhead 16.0% regression
Date: Tue, 09 Jul 2019 10:39:20 +0800
Message-ID: <e29f82e0-6847-b264-300b-130bb31399d1@linux.intel.com>
In-Reply-To: <DM5PR13MB1851813BBEA446E25C5001C2B8F60@DM5PR13MB1851.namprd13.prod.outlook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8823869998302191075==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Trond,

On 7/8/2019 7:44 PM, Trond Myklebust wrote:
> I've asked several times now about how to interpret your results. As far =

> as I can tell from your numbers, the overhead appears to be entirely =

> contained in the NUMA section of your results.
> IOW: it would appear to be a scheduling overhead due to NUMA. I've been =

> asking whether or not that is a correct interpretation of the numbers =

> you published.
Thanks for your feedback. I used the same hardware and the same test =

parameters to test the two commits:
    e791f8e938 ("SUNRPC: Convert xs_send_kvec() to use iov_iter_kvec()")
    0472e47660 ("SUNRPC: Convert socket page send code to use iov_iter()")

If it is caused by NUMA, why only commit 0472e47660 throughput is =

decreased? The filesystem we test is NFS, commit 0472e47660 is related =

with the network, could you help to check if have any other clues for =

the regression. Thanks.

-- =

Zhengjun Xing

--===============8823869998302191075==--

