Content-Type: multipart/mixed; boundary="===============4780881813137971214=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: 6c409a3aee: kernel_selftests.bpf.test_verifier.fail
Date: Mon, 24 Jun 2019 08:43:28 +0800
Message-ID: <6113e667-fd7c-decc-7d3f-893d7a3f000e@intel.com>
In-Reply-To: <CAADnVQ+frnYN6E5zyrNvbnhQ_XgvrEEtghiS7DOKoe6o_ErYRw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4780881813137971214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/21/19 11:52 PM, Alexei Starovoitov wrote:
> On Fri, Jun 21, 2019 at 1:36 AM kernel test robot <rong.a.chen@intel.co=
m> wrote:
>> # #340/p direct packet access: test22 (x +=3D pkt_ptr, 3) OK
>> # #341/p direct packet access: test23 (x +=3D pkt_ptr, 4) FAIL
>> # Unexpected success to load!
>> # verification time 17 usec
>> # stack depth 8
>> # processed 18 insns (limit 1000000) max_states_per_insn 0 total_states =
1 peak_states 1 mark_read 0
>> # #342/p direct packet access: test24 (x +=3D pkt_ptr, 5) OK
>> # #343/p direct packet access: test25 (marking on <, good access) OK
> ..
>> # #673/p meta access, test9 OK
>> # #674/p meta access, test10 FAIL
>> # Unexpected success to load!
>> # verification time 29 usec
>> # stack depth 8
>> # processed 19 insns (limit 1000000) max_states_per_insn 0 total_states =
1 peak_states 1 mark_read 0
>> # #675/p meta access, test11 OK
> Hi Rong,
>
> the patch quoted is not in bpf-next/net-next.
> This patch is work-in-progress that I posted to mailing list
> and pushed into my own git branch on kernel.org.
> It's awesome that build bot does this early testing.
> I really like it.
> Would be great if the bot can add a tag to email subject that it's testing
> this not yet merged patch.
>
> Right now since the email says
> commit: 6c409a3aee945e50c6dd4109689f52
> it felt that this is real commit and my initial reaction
> was that 'ohh something is broken in the merge code'
> which wasn't the case :)


Hi Alexei,

Thanks for the advice, we'll improve the email subject.

Best Regards,
Rong Chen




--===============4780881813137971214==--

