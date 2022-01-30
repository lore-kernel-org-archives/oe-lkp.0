Content-Type: multipart/mixed; boundary="===============3729293257042384775=="
MIME-Version: 1.0
From: Michel Lespinasse <michel@lespinasse.org>
To: lkp@lists.01.org
Subject: Re: [mm] fa5331bae2: canonical_address#:#[##]
Date: Sat, 29 Jan 2022 21:08:54 -0800
Message-ID: <20220130050854.GC18863@lespinasse.org>
In-Reply-To: <20220130025449.GE1351@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3729293257042384775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 30, 2022 at 10:54:49AM +0800, kernel test robot wrote:
> +------------------------------------------+------------+------------+
> |                                          | b19284b7ad | fa5331bae2 |
> +------------------------------------------+------------+------------+
> | canonical_address#:#[##]                 | 0          | 10         |
> | RIP:__handle_mm_fault                    | 0          | 10         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 10         |
> +------------------------------------------+------------+------------+

Thanks. I think this might be the direct result of the uninitialized
vmf variable as previously reported in
https://lore.kernel.org/linux-mm/202201290445.uKuWeLmf-lkp(a)intel.com/
--===============3729293257042384775==--

