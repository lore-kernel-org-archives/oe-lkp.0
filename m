Content-Type: multipart/mixed; boundary="===============4630173935766932585=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [KVM] e08571e819: WARNING:at_drivers/gpu/drm/drm_vblank.c:#drm_wait_one_vblank[drm]
Date: Tue, 03 Sep 2019 16:16:30 +0800
Message-ID: <dfc4ec40-9711-01e5-be1d-3d64c8b86f6c@intel.com>
In-Reply-To: <20190903081304.GC15734@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4630173935766932585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sorry, the subject is wrong, please ignore this mail.

Best Regards,
Rong Chen

On 9/3/19 4:13 PM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: e08571e819dca343b575bf0dcd89a28637b43ba0 ("[PATCH] KVM: lapic: re=
start counter on change to periodic mode")
> url: https://github.com/0day-ci/linux/commits/Matt-delco/KVM-lapic-restar=
t-counter-on-change-to-periodic-mode/20190820-121924
>
>
> in testcase: kvm-unit-tests
> with following parameters:
>
> 	ucode: 0x27
>
>
>
> on test machine: 8 threads Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz with 8=
G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
>
>
> 2019-09-02 22:45:10 ./run_tests.sh
> =1B[31mFAIL=1B[0m apic-split (53 tests, 2 unexpected failures)
> =1B[32mPASS=1B[0m ioapic-split (19 tests)
> =1B[31mFAIL=1B[0m apic (53 tests, 2 unexpected failures)
> =1B[32mPASS=1B[0m ioapic (19 tests)
> =1B[32mPASS=1B[0m smptest (1 tests)
> =1B[32mPASS=1B[0m smptest3 (1 tests)
> =1B[32mPASS=1B[0m vmexit_cpuid
> =1B[32mPASS=1B[0m vmexit_vmcall
> =1B[32mPASS=1B[0m vmexit_mov_from_cr8
> =1B[32mPASS=1B[0m vmexit_mov_to_cr8
> =1B[32mPASS=1B[0m vmexit_inl_pmtimer
> =1B[32mPASS=1B[0m vmexit_ipi
> =1B[32mPASS=1B[0m vmexit_ipi_halt
> =1B[32mPASS=1B[0m vmexit_ple_round_robin
> =1B[32mPASS=1B[0m vmexit_tscdeadline
> =1B[32mPASS=1B[0m vmexit_tscdeadline_immed
> =1B[32mPASS=1B[0m access
> =1B[33mSKIP=1B[0m smap (0 tests)
> =1B[33mSKIP=1B[0m pku (0 tests)
> =1B[32mPASS=1B[0m asyncpf (1 tests)
> =1B[32mPASS=1B[0m emulator (125 tests, 2 skipped)
> =1B[32mPASS=1B[0m eventinj (13 tests)
> =1B[32mPASS=1B[0m hypercall (2 tests)
> =1B[32mPASS=1B[0m idt_test (4 tests)
> =1B[32mPASS=1B[0m memory (8 tests)
> =1B[32mPASS=1B[0m msr (12 tests)
> =1B[32mPASS=1B[0m pmu (67 tests)
> =1B[31mFAIL=1B[0m vmware_backdoors (11 tests, 5 unexpected failures)
> =1B[32mPASS=1B[0m port80
> =1B[32mPASS=1B[0m realmode
> =1B[32mPASS=1B[0m s3
> =1B[32mPASS=1B[0m sieve
> =1B[32mPASS=1B[0m syscall (2 tests)
> =1B[32mPASS=1B[0m tsc (3 tests)
> =1B[32mPASS=1B[0m tsc_adjust (5 tests)
> =1B[32mPASS=1B[0m xsave (17 tests)
> =1B[32mPASS=1B[0m rmap_chain
> =1B[33mSKIP=1B[0m svm (0 tests)
> =1B[33mSKIP=1B[0m taskswitch (i386 only)
> =1B[33mSKIP=1B[0m taskswitch2 (i386 only)
> =1B[32mPASS=1B[0m kvmclock_test
> =1B[32mPASS=1B[0m pcid (3 tests)
> =1B[32mPASS=1B[0m umip (21 tests)
> =1B[32mPASS=1B[0m vmx (7308 tests, 5 expected failures, 5 skipped)
> =1B[33mSKIP=1B[0m ept (0 tests)
> =1B[33mSKIP=1B[0m vmx_eoi_bitmap_ioapic_scan (1 tests, 1 skipped)
> =1B[33mSKIP=1B[0m vmx_hlt_with_rvi_test (1 tests, 1 skipped)
> =1B[33mSKIP=1B[0m vmx_apicv_test (2 tests, 2 skipped)
> =1B[32mPASS=1B[0m vmx_apic_passthrough_thread (8 tests)
> =1B[32mPASS=1B[0m vmx_vmcs_shadow_test (142218 tests)
> =1B[32mPASS=1B[0m debug (11 tests)
> =1B[32mPASS=1B[0m hyperv_synic (1 tests)
> =1B[33mSKIP=1B[0m hyperv_connections (1 tests, 1 skipped)
> =1B[32mPASS=1B[0m hyperv_stimer (12 tests)
> =1B[32mPASS=1B[0m hyperv_clock
> =1B[32mPASS=1B[0m intel_iommu (11 tests)
>
> To reproduce:
>
>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install job.yaml  # job file is attached in this email
>          bin/lkp run     job.yaml
>
>
>
> Thanks,
> Rong Chen
>
>
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp


--===============4630173935766932585==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsKICAgICAgY2hhcnNldD13aW5kb3dzLTEyNTIiPgogIDwvaGVhZD4KICA8
Ym9keSBzbWFydHRlbXBsYXRlaW5zZXJ0ZWQ9InRydWUiPgogICAgU29ycnksIHRoZSBzdWJqZWN0
IGlzIHdyb25nLCBwbGVhc2UgaWdub3JlIHRoaXMgbWFpbC48YnI+CiAgICA8YnI+CiAgICBCZXN0
IFJlZ2FyZHMsPGJyPgogICAgUm9uZyBDaGVuPGJyPgogICAgPGJyPgogICAgPGRpdiBjbGFzcz0i
bW96LWNpdGUtcHJlZml4Ij5PbiA5LzMvMTkgNDoxMyBQTSwga2VybmVsIHRlc3Qgcm9ib3QKICAg
ICAgd3JvdGU6PGJyPgogICAgPC9kaXY+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAg
ICBjaXRlPSJtaWQ6MjAxOTA5MDMwODEzMDQuR0MxNTczNEBzaGFvMi1kZWJpYW4iPgogICAgICA8
cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPkZZSSwgd2Ugbm90aWNlZCB0aGUgZm9s
bG93aW5nIGNvbW1pdCAoYnVpbHQgd2l0aCBnY2MtNyk6Cgpjb21taXQ6IGUwODU3MWU4MTlkY2Ez
NDNiNTc1YmYwZGNkODlhMjg2MzdiNDNiYTAgKCJbUEFUQ0hdIEtWTTogbGFwaWM6IHJlc3RhcnQg
Y291bnRlciBvbiBjaGFuZ2UgdG8gcGVyaW9kaWMgbW9kZSIpCnVybDogPGEgY2xhc3M9Im1vei10
eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tLzBkYXktY2kvbGludXgv
Y29tbWl0cy9NYXR0LWRlbGNvL0tWTS1sYXBpYy1yZXN0YXJ0LWNvdW50ZXItb24tY2hhbmdlLXRv
LXBlcmlvZGljLW1vZGUvMjAxOTA4MjAtMTIxOTI0Ij5odHRwczovL2dpdGh1Yi5jb20vMGRheS1j
aS9saW51eC9jb21taXRzL01hdHQtZGVsY28vS1ZNLWxhcGljLXJlc3RhcnQtY291bnRlci1vbi1j
aGFuZ2UtdG8tcGVyaW9kaWMtbW9kZS8yMDE5MDgyMC0xMjE5MjQ8L2E+CgoKaW4gdGVzdGNhc2U6
IGt2bS11bml0LXRlc3RzCndpdGggZm9sbG93aW5nIHBhcmFtZXRlcnM6CgoJdWNvZGU6IDB4MjcK
CgoKb24gdGVzdCBtYWNoaW5lOiA4IHRocmVhZHMgSW50ZWwoUikgQ29yZShUTSkgaTctNDc3MCBD
UFUgQCAzLjQwR0h6IHdpdGggOEcgbWVtb3J5CgpjYXVzZWQgYmVsb3cgY2hhbmdlcyAocGxlYXNl
IHJlZmVyIHRvIGF0dGFjaGVkIGRtZXNnL2ttc2cgZm9yIGVudGlyZSBsb2cvYmFja3RyYWNlKToK
CgoKSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9sbG93aW5nIHRhZwpSZXBvcnRl
ZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIg
aHJlZj0ibWFpbHRvOnJvbmcuYS5jaGVuQGludGVsLmNvbSI+Jmx0O3JvbmcuYS5jaGVuQGludGVs
LmNvbSZndDs8L2E+CgoKMjAxOS0wOS0wMiAyMjo0NToxMCAuL3J1bl90ZXN0cy5zaAobWzMxbUZB
SUwbWzBtIGFwaWMtc3BsaXQgKDUzIHRlc3RzLCAyIHVuZXhwZWN0ZWQgZmFpbHVyZXMpChtbMzJt
UEFTUxtbMG0gaW9hcGljLXNwbGl0ICgxOSB0ZXN0cykKG1szMW1GQUlMG1swbSBhcGljICg1MyB0
ZXN0cywgMiB1bmV4cGVjdGVkIGZhaWx1cmVzKQobWzMybVBBU1MbWzBtIGlvYXBpYyAoMTkgdGVz
dHMpChtbMzJtUEFTUxtbMG0gc21wdGVzdCAoMSB0ZXN0cykKG1szMm1QQVNTG1swbSBzbXB0ZXN0
MyAoMSB0ZXN0cykKG1szMm1QQVNTG1swbSB2bWV4aXRfY3B1aWQgChtbMzJtUEFTUxtbMG0gdm1l
eGl0X3ZtY2FsbCAKG1szMm1QQVNTG1swbSB2bWV4aXRfbW92X2Zyb21fY3I4IAobWzMybVBBU1Mb
WzBtIHZtZXhpdF9tb3ZfdG9fY3I4IAobWzMybVBBU1MbWzBtIHZtZXhpdF9pbmxfcG10aW1lciAK
G1szMm1QQVNTG1swbSB2bWV4aXRfaXBpIAobWzMybVBBU1MbWzBtIHZtZXhpdF9pcGlfaGFsdCAK
G1szMm1QQVNTG1swbSB2bWV4aXRfcGxlX3JvdW5kX3JvYmluIAobWzMybVBBU1MbWzBtIHZtZXhp
dF90c2NkZWFkbGluZSAKG1szMm1QQVNTG1swbSB2bWV4aXRfdHNjZGVhZGxpbmVfaW1tZWQgChtb
MzJtUEFTUxtbMG0gYWNjZXNzIAobWzMzbVNLSVAbWzBtIHNtYXAgKDAgdGVzdHMpChtbMzNtU0tJ
UBtbMG0gcGt1ICgwIHRlc3RzKQobWzMybVBBU1MbWzBtIGFzeW5jcGYgKDEgdGVzdHMpChtbMzJt
UEFTUxtbMG0gZW11bGF0b3IgKDEyNSB0ZXN0cywgMiBza2lwcGVkKQobWzMybVBBU1MbWzBtIGV2
ZW50aW5qICgxMyB0ZXN0cykKG1szMm1QQVNTG1swbSBoeXBlcmNhbGwgKDIgdGVzdHMpChtbMzJt
UEFTUxtbMG0gaWR0X3Rlc3QgKDQgdGVzdHMpChtbMzJtUEFTUxtbMG0gbWVtb3J5ICg4IHRlc3Rz
KQobWzMybVBBU1MbWzBtIG1zciAoMTIgdGVzdHMpChtbMzJtUEFTUxtbMG0gcG11ICg2NyB0ZXN0
cykKG1szMW1GQUlMG1swbSB2bXdhcmVfYmFja2Rvb3JzICgxMSB0ZXN0cywgNSB1bmV4cGVjdGVk
IGZhaWx1cmVzKQobWzMybVBBU1MbWzBtIHBvcnQ4MCAKG1szMm1QQVNTG1swbSByZWFsbW9kZSAK
G1szMm1QQVNTG1swbSBzMyAKG1szMm1QQVNTG1swbSBzaWV2ZSAKG1szMm1QQVNTG1swbSBzeXNj
YWxsICgyIHRlc3RzKQobWzMybVBBU1MbWzBtIHRzYyAoMyB0ZXN0cykKG1szMm1QQVNTG1swbSB0
c2NfYWRqdXN0ICg1IHRlc3RzKQobWzMybVBBU1MbWzBtIHhzYXZlICgxNyB0ZXN0cykKG1szMm1Q
QVNTG1swbSBybWFwX2NoYWluIAobWzMzbVNLSVAbWzBtIHN2bSAoMCB0ZXN0cykKG1szM21TS0lQ
G1swbSB0YXNrc3dpdGNoIChpMzg2IG9ubHkpChtbMzNtU0tJUBtbMG0gdGFza3N3aXRjaDIgKGkz
ODYgb25seSkKG1szMm1QQVNTG1swbSBrdm1jbG9ja190ZXN0IAobWzMybVBBU1MbWzBtIHBjaWQg
KDMgdGVzdHMpChtbMzJtUEFTUxtbMG0gdW1pcCAoMjEgdGVzdHMpChtbMzJtUEFTUxtbMG0gdm14
ICg3MzA4IHRlc3RzLCA1IGV4cGVjdGVkIGZhaWx1cmVzLCA1IHNraXBwZWQpChtbMzNtU0tJUBtb
MG0gZXB0ICgwIHRlc3RzKQobWzMzbVNLSVAbWzBtIHZteF9lb2lfYml0bWFwX2lvYXBpY19zY2Fu
ICgxIHRlc3RzLCAxIHNraXBwZWQpChtbMzNtU0tJUBtbMG0gdm14X2hsdF93aXRoX3J2aV90ZXN0
ICgxIHRlc3RzLCAxIHNraXBwZWQpChtbMzNtU0tJUBtbMG0gdm14X2FwaWN2X3Rlc3QgKDIgdGVz
dHMsIDIgc2tpcHBlZCkKG1szMm1QQVNTG1swbSB2bXhfYXBpY19wYXNzdGhyb3VnaF90aHJlYWQg
KDggdGVzdHMpChtbMzJtUEFTUxtbMG0gdm14X3ZtY3Nfc2hhZG93X3Rlc3QgKDE0MjIxOCB0ZXN0
cykKG1szMm1QQVNTG1swbSBkZWJ1ZyAoMTEgdGVzdHMpChtbMzJtUEFTUxtbMG0gaHlwZXJ2X3N5
bmljICgxIHRlc3RzKQobWzMzbVNLSVAbWzBtIGh5cGVydl9jb25uZWN0aW9ucyAoMSB0ZXN0cywg
MSBza2lwcGVkKQobWzMybVBBU1MbWzBtIGh5cGVydl9zdGltZXIgKDEyIHRlc3RzKQobWzMybVBB
U1MbWzBtIGh5cGVydl9jbG9jayAKG1szMm1QQVNTG1swbSBpbnRlbF9pb21tdSAoMTEgdGVzdHMp
CgpUbyByZXByb2R1Y2U6CgogICAgICAgIGdpdCBjbG9uZSA8YSBjbGFzcz0ibW96LXR4dC1saW5r
LWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvbGtwLXRlc3RzLmdpdCI+
aHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xrcC10ZXN0cy5naXQ8L2E+CiAgICAgICAgY2QgbGtw
LXRlc3RzCiAgICAgICAgYmluL2xrcCBpbnN0YWxsIGpvYi55YW1sICAjIGpvYiBmaWxlIGlzIGF0
dGFjaGVkIGluIHRoaXMgZW1haWwKICAgICAgICBiaW4vbGtwIHJ1biAgICAgam9iLnlhbWwKCgoK
VGhhbmtzLApSb25nIENoZW4KCjwvcHJlPgogICAgICA8YnI+CiAgICAgIDxmaWVsZHNldCBjbGFz
cz0ibWltZUF0dGFjaG1lbnRIZWFkZXIiPjwvZmllbGRzZXQ+CiAgICAgIDxwcmUgY2xhc3M9Im1v
ei1xdW90ZS1wcmUiIHdyYXA9IiI+X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTEtQIG1haWxpbmcgbGlzdAo8YSBjbGFzcz0ibW96LXR4dC1saW5rLWFiYnJl
dmlhdGVkIiBocmVmPSJtYWlsdG86TEtQQGxpc3RzLjAxLm9yZyI+TEtQQGxpc3RzLjAxLm9yZzwv
YT4KPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9saXN0cy4w
MS5vcmcvbWFpbG1hbi9saXN0aW5mby9sa3AiPmh0dHBzOi8vbGlzdHMuMDEub3JnL21haWxtYW4v
bGlzdGluZm8vbGtwPC9hPgo8L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxicj4KICA8L2Jv
ZHk+CjwvaHRtbD4K

--===============4630173935766932585==--

