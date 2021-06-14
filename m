Content-Type: multipart/mixed; boundary="===============3191638800273784565=="
MIME-Version: 1.0
From: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
To: lkp@lists.01.org
Subject: Re: [mm/mremap] ecf8443e51: vm-scalability.throughput -29.4% regression
Date: Mon, 14 Jun 2021 21:38:44 +0530
Message-ID: <a815a022-cf3e-fe4b-ee23-191523ed1980@linux.ibm.com>
In-Reply-To: <20210614145536.GB28801@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3191638800273784565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/14/21 8:25 PM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -29.4% regression of vm-scalability.throughput due to c=
ommit:
> =

> =

> commit: ecf8443e51a862b261313c2319ab4e4aed9e6b7e ("[PATCH v7 02/11] mm/mr=
emap: Fix race between MOVE_PUD mremap and pageout")
> url: https://github.com/0day-ci/linux/commits/Aneesh-Kumar-K-V/Speedup-mr=
emap-on-ppc64/20210607-135424
> base: https://git.kernel.org/cgit/linux/kernel/git/powerpc/linux.git next
> =

>

We dropped that approach and is now using =

https://lore.kernel.org/linux-mm/20210610083549.386085-1-aneesh.kumar(a)lin=
ux.ibm.com =



Instead of pud lock we are now using rmap lock with mremap.

Can you check with that series?

-aneesh
--===============3191638800273784565==--

