Content-Type: multipart/mixed; boundary="===============2687208423003771052=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Thu, 09 Mar 2017 23:11:17 +0100
Message-ID: <58C1D305.8090802@iogearbox.net>
In-Reply-To: <20170309220732.ufqoqlawktsi2gao@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============2687208423003771052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/09/2017 11:07 PM, Borislav Petkov wrote:
> On Thu, Mar 09, 2017 at 10:55:47PM +0100, Borislav Petkov wrote:
>> Can you make that:
>>
>> 	setup_clear_cpu_cap(X86_FEATURE_PGE);
>>
>> and see if it fixes your issue?
>
> Hmm, in reading the thread a bit more, that might not work. If I see it
> correctly, lguest does
>
>   clear_cpu_cap(&boot_cpu_data, X86_FEATURE_PGE);
>
> after the alternatives have run and static_cpu_has() sites have already
> been patched so clearing that bit won't bring anything.

Yeah, I just tried that out and it had no effect unfortunately, the
static_cpu_has() was still 1.

--===============2687208423003771052==--

