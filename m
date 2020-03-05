Content-Type: multipart/mixed; boundary="===============0395870583935139156=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [cpufreq] 909c0e9cc1: fwq.fwq.med 210.0% improvement
Date: Thu, 05 Mar 2020 16:18:24 +0800
Message-ID: <cbe4887c-d54a-c4aa-e4bf-981b5fcc291d@intel.com>
In-Reply-To: <951b0986-bb35-d9a5-1639-0a8cdb3dcd04@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0395870583935139156==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 3/5/20 3:50 PM, Rafael J. Wysocki wrote:
> On 3/5/2020 2:35 AM, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed a 210.0% improvement of fwq.fwq.med due to commit:
>
> Well, that sounds impressive. :-)
>
>
>>
>> commit: 909c0e9cc11ba39fa5a660583b25c2431cf54deb ("cpufreq: =

>> intel_pstate: Use passive mode by default without HWP")
>> https://git.kernel.org/cgit/linux/kernel/git/rafael/linux-pm.git =

>> intel_pstate-passive
>>
>> in testcase: fwq
>> on test machine: 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz =

>> with 48G memory
>> with following parameters:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0nr_task: 100%
>> =C2=A0=C2=A0=C2=A0=C2=A0samples: 100000ss
>> =C2=A0=C2=A0=C2=A0=C2=A0iterations: 18x
>> =C2=A0=C2=A0=C2=A0=C2=A0cpufreq_governor: powersave
>
> The governor should be schedutil, though, unless it is explicitly set =

> to powersave in the test environment.
>
> Is that the case?
>
>

Hi Rafael,

Yes, we set to powersave for this test.

user=C2=A0 :notice: [=C2=A0 +0.061763] 2020-03-04 21:15:33
user=C2=A0 :notice: [=C2=A0 +0.057012] for cpu_dir in =

/sys/devices/system/cpu/cpu[0-9]*
user=C2=A0 :notice: [=C2=A0 +0.059494] do
user=C2=A0 :notice: [=C2=A0 +0.046899]=C2=A0=C2=A0=C2=A0 online_file=3D"$cp=
u_dir"/online
user=C2=A0 :notice: [=C2=A0 +0.074995]=C2=A0=C2=A0=C2=A0 [ -f "$online_file=
" ] && [ "$(cat =

"$online_file")" -eq 0 ] && continue
user=C2=A0 :notice: [=C2=A0 +0.080600] file=3D"$cpu_dir"/cpufreq/scaling_go=
vernor
user=C2=A0 :notice: [=C2=A0 +0.067584]=C2=A0=C2=A0=C2=A0 [ -f "$file" ] && =
echo "powersave" > "$file"
user=C2=A0 :notice: [=C2=A0 +0.050203] done
user=C2=A0 :notice: [=C2=A0 +0.084039]=C2=A0=C2=A0=C2=A0 Internal Reference=
 Designator: IPMI_LAN
user=C2=A0 :notice: [=C2=A0 +0.059001]=C2=A0=C2=A0=C2=A0 External Reference=
 Designator: IPMI_LAN
user=C2=A0 :notice: [=C2=A0 +0.056562] IPMI Device Information
user=C2=A0 :notice: [=C2=A0 +0.058074] BMC ARP Control=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 : ARP Responses =

Enabled, Gratuitous ARP Disabled
user=C2=A0 :notice: [=C2=A0 +0.053677] 2020-03-04 21:15:34 ./t_fwq -n 10000=
0 -w 18 =

-t 16
user=C2=A0 :notice: [Mar 4 21:22] numthreads =3D 16
user=C2=A0 :notice: [=C2=A0 +0.007123] thread number 1 being created.
user=C2=A0 :notice: [=C2=A0 +0.008334] thread number 2 being created.
user=C2=A0 :notice: [=C2=A0 +0.008335] thread number 3 being created.
user=C2=A0 :notice: [=C2=A0 +0.008222] thread number 4 being created.
user=C2=A0 :notice: [=C2=A0 +0.008359] thread number 5 being created.
user=C2=A0 :notice: [=C2=A0 +0.008360] thread number 6 being created.
user=C2=A0 :notice: [=C2=A0 +0.008128] thread number 7 being created.
user=C2=A0 :notice: [=C2=A0 +0.008409] thread number 8 being created.
user=C2=A0 :notice: [=C2=A0 +0.008317] thread number 9 being created.
user=C2=A0 :notice: [=C2=A0 +0.008352] thread number 10 being created.
user=C2=A0 :notice: [=C2=A0 +0.008480] thread number 11 being created.
user=C2=A0 :notice: [=C2=A0 +0.008393] thread number 12 being created.
user=C2=A0 :notice: [=C2=A0 +0.008519] thread number 13 being created.
user=C2=A0 :notice: [=C2=A0 +0.008518] thread number 14 being created.
user=C2=A0 :notice: [=C2=A0 +0.008266] thread number 15 being created.
user=C2=A0 :notice: [=C2=A0 +0.009492] Starting FWQ_CORE with work_length =
=3D 262144
user=C2=A0 :notice: [=C2=A0 +0.010539] Starting FWQ_CORE with work_length =
=3D 262144
user=C2=A0 :notice: [=C2=A0 +0.010499] Starting FWQ_CORE with work_length =
=3D 262144
user=C2=A0 :notice: [=C2=A0 +0.010492] Starting FWQ_CORE with work_length =
=3D 262144
user=C2=A0 :notice: [=C2=A0 +0.010473] Starting FWQ_CORE with work_length =
=3D 262144
user=C2=A0 :notice: [=C2=A0 +0.010255] Starting FWQ_CORE with work_length =
=3D 262144
user=C2=A0 :notice: [=C2=A0 +0.010525] Starting FWQ_CORE with work_length =
=3D 262144
user=C2=A0 :notice: [=C2=A0 +0.013377] Starting FWQ_CORE with work_length =
=3D 262144
user=C2=A0 :notice: [=C2=A0 +0.013653] Starting FWQ_CORE with work_length =
=3D 262144
user=C2=A0 :notice: [=C2=A0 +0.013755] Starting FWQ_CORE with work_length =
=3D 262144
user=C2=A0 :notice: [=C2=A0 +0.013936] Starting FWQ_CORE with work_length =
=3D 262144
user=C2=A0 :notice: [=C2=A0 +0.013843] Starting FWQ_CORE with work_length =
=3D 262144
user=C2=A0 :notice: [=C2=A0 +0.013884] Starting FWQ_CORE with work_length =
=3D 262144
user=C2=A0 :notice: [=C2=A0 +0.013685] Starting FWQ_CORE with work_length =
=3D 262144
user=C2=A0 :notice: [=C2=A0 +0.013835] Starting FWQ_CORE with work_length =
=3D 262144
user=C2=A0 :notice: [=C2=A0 +0.013927] Starting FWQ_CORE with work_length =
=3D 262144


Best Regards,
Rong Chen
--===============0395870583935139156==--

