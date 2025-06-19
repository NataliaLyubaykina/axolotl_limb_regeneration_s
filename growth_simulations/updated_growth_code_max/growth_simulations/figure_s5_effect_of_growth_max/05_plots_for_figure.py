import numpy as np
import matplotlib.pyplot as plt
from tqdm import tqdm
import math
import os
from matplotlib.backends.backend_agg import FigureCanvasAgg as FigureCanvas

from euler_scheme_1d_with_growth import two_morph, one_morph
from matplotlib_defaults import *

USE_TEX = True  # Set to True to enable LaTeX rendering
if USE_TEX:
    plt.rcParams['text.usetex'] = True


def parse_parameters(file_path):
    params = {}
    with open(file_path, 'r') as file:
        for line in file:
            line = line.strip()
            if not line or line.endswith(":"):
                continue
            try:
                key, value = line.split(": ", 1)
                if key == "lambda (sqrt(D/beta))":
                    params['lam'] = float(value)
                elif "." in value or "e" in value:
                    params[key] = float(value)
                else:
                    params[key] = int(value)
            except ValueError:
                continue
    return params

def list_visible_folders(path):
    return [
        item for item in os.listdir(path)
        if not item.startswith(".") and os.path.isdir(os.path.join(path, item))
    ]

def compute_thresholds(params, Lfinals):
    return np.array([
        two_morph.threshold_vs_Lfinal(Lf, params['x0'], params['lam'], params['alpha'], params['w'], params['beta'], params['D'])
        for Lf in Lfinals
    ])

def compute_thresholds_one(params, Lfinals):
    return np.array([
        one_morph.threshold_vs_Lfinal(Lf, params['x0'], params['lam'], params['alpha'], params['w'], params['beta'], params['D'])
        for Lf in Lfinals
    ])

def compute_Lfinals_to_reach(params, thresholds):
    return np.array([
        two_morph.Lfinal(th, params['x0'], params['lam'], params['alpha'], params['w'], params['beta'], params['D'])
        for th in thresholds
    ])

def compute_Lfinals_to_reach_one(params, thresholds):
    return np.array([
        one_morph.Lfinal(th, params['x0'], params['lam'], params['alpha'], params['w'], params['beta'], params['D'])
        for th in thresholds
    ])


def collect_simulated_Lfinal(folder, thresholds_to_test, g_to_test):
    Lfinal_sim = { g: dict(zip(thresholds_to_test, np.zeros(len(thresholds_to_test)))) for g in g_to_test }
    for ng in g_to_test:
        for nth in thresholds_to_test:
            for nfolder in os.listdir(folder):
                if str(ng) in nfolder and str(nth) in nfolder:
                    nfolder_path = os.path.join(folder, nfolder)
                    #time_to_save = np.load(os.path.join(nfolder_path, 'time_to_save.npy'))
                    Lt = np.load(os.path.join(nfolder_path, 'Lt.npy'))
                    Lfinal_sim[ng][nth] = Lt[-1]
    return Lfinal_sim

def plot_dynamics(folder, thresholds_to_test, g_to_test):
    fig, ax = plt.subplots(len(thresholds_to_test), 1, figsize=(default_figsize["large"][0]/3, default_figsize["large"][1]), dpi=200, sharex=True, sharey=True)
    for i, ng in enumerate(g_to_test):
        for j, nth in enumerate(thresholds_to_test):
            for nfolder in os.listdir(folder):
                if str(ng) in nfolder and str(nth) in nfolder:
                    nfolder_path = os.path.join(folder, nfolder)
                    time_to_save = np.load(os.path.join(nfolder_path, 'time_to_save.npy'))
                    Lt = np.load(os.path.join(nfolder_path, 'Lt.npy'))
                    ax.plot(time_to_save, Lt, label=f'gL? = {ng}')
                    ax.set_title(f'th = {np.round(nth, 2)}', fontsize=6)
                    ax.set_xlabel('time, t')
                    ax.set_ylabel('size, L(t)')
                    ax.legend()
                    ax.set_ylim(0, 4.5)
    plt.tight_layout()
    plt.show()

def plot_final_vs_threshold(thresholds, thresholds_to_test, Lfinals, Lfinals_to_reach, Lfinal_simulated, params):
    fig = plt.figure(figsize=default_figsize['small'])
    ax = plt.subplot()
    ax.plot(thresholds*params['beta']/params['alpha']/params['w'], Lfinals/params['lam'])
    ax.plot(thresholds_to_test*params['beta']/params['alpha']/params['w'], Lfinals_to_reach/params['lam'], '.')
    for ng in Lfinal_simulated:
        ax.plot(
            np.array(list(Lfinal_simulated[ng].keys()))*params['beta']/params['alpha']/params['w'],
            np.array([Lfinal_simulated[ng][nth] for nth in Lfinal_simulated[ng]])/params['lam'],
            'x', markerfacecolor='none', label=f'g = {ng}'
        )
    ax.fill_between(np.linspace(0, 2), 0, params['x0'] + params['w'], color='gray', alpha=0.5)
    ax.set_xlabel(r'Threshold, $\Theta \beta / \alpha w$')
    ax.set_ylabel(r'Final system size, $L^*/\lambda$')
    plt.xlim(0, 1.2)
    plt.ylim(0, 4)
    ax.legend(loc='upper right')
    #plt.savefig('fig/two_morph_gstatic_Lfinal_dynamics.pdf', bbox_inches='tight')
    plt.show()

def plot_Lfinal_ratio_vs_growth(g_to_test, thresholds_to_test, Lfinal_simulated, Lfinals_to_reach):
    th = thresholds_to_test[0]
    yvals = np.array([Lfinal_simulated[g][th] for g in g_to_test]) / Lfinals_to_reach[0]

    fig = plt.figure(figsize=default_figsize['small'])
    ax = plt.subplot()
    ax.plot(g_to_test, yvals, 'x', color='C0')
    #ax.plot(g_to_test, yvals , label=free_text_label[i])
    ax.axhline(1.0, color='black', linewidth=0.5)
    ax.set_xlabel('Growth rate, $g$')
    ax.set_ylabel(r'$L^*_{\mathrm{sim}} / L^*_{\mathrm{adiabatic}}$')
    ax.set_ylim(0, 1.2)
    ax.legend(loc='lower right') 
    plt.subplots_adjust(left=0.18,bottom=0.2)
    plt.savefig('fig/one_morph_Lfinal_ratio.pdf', bbox_inches='tight')
    plt.show()


    

def plot_kymograph(grsizet, x_centerst, grt, Lt,params):
        nrows, ncols = 51, 1
        fig, ax = plt.subplots(nrows, ncols)
        t_to_plot = np.linspace(0, params['tmax'], nrows)
        middle = 0
        for i in range(nrows):
            ax_i = plt.subplot(nrows, ncols, i+1)
            n = int(t_to_plot[i] / params['dt'] / (params['ndt'] / params['ndt_to_save']))
            x_start = middle - Lt[n] / 2
            ax_i.add_patch(plt.Rectangle((x_start, 0), Lt[n], 1, color='gray', alpha=0.5))
            ax_i.add_patch(plt.Rectangle((x_start + params['x0'], 0), params['w'], 1, color='red', alpha=0.5))
            ax_i.add_patch(plt.Rectangle((x_start + Lt[n] - params['w'] - params['x0'], 0), params['w'], 1, color='blue', alpha=0.5))
            if grsizet[n] != 0:
                x0gr = x_centerst[n][np.nonzero(grt[n])[0][0]]
                ax_i.add_patch(plt.Rectangle((x_start + x0gr, 0), grsizet[n], 1, color='green', alpha=0.5))
            ax_i.set_xlim(-0.6 * max(Lt), 0.5 * max(Lt))
            ax_i.set_axis_off()
        return fig

def plot_kymograph_stack(folder, thresholds_to_test, g_to_test, params):
    

    nrows, ncols = len(thresholds_to_test), len(g_to_test)
    fig, ax = plt.subplots(nrows, ncols, figsize=(default_figsize["large"][0], default_figsize["large"][1]))

    for i, ng in enumerate(g_to_test):
        for j, nth in enumerate(thresholds_to_test):
            for nfolder in os.listdir(folder):
                if str(ng) in nfolder and str(nth) in nfolder:
                    nfolder_path = os.path.join(folder, nfolder)
                    grsizet = np.load(os.path.join(nfolder_path, 'grsizet.npy'))
                    x_centerst = np.load(os.path.join(nfolder_path, 'x_centerst.npy'))
                    grt = np.load(os.path.join(nfolder_path, 'grt.npy'))
                    Lt = np.load(os.path.join(nfolder_path, 'Lt.npy'))
            kymo_fig = plot_kymograph(grsizet, x_centerst, grt, Lt,params)
            canvas = FigureCanvas(kymo_fig)
            canvas.draw()
            kymo_array = np.frombuffer(canvas.buffer_rgba(), dtype='uint8')
            kymo_array = kymo_array.reshape(canvas.get_width_height()[::-1] + (4,))
            ax[i].imshow(kymo_array)
            ax[i].axis('off')
            ax[i].set_title(f'g = {ng}, th = {np.round(nth, 2)}', fontsize=6)
            plt.close(kymo_fig)

    plt.tight_layout()
    plt.show()

def find_closest_index(array, value):
    array = np.array(array)
    valid_mask = ~np.isnan(array)
    valid_array = array[valid_mask]
    if valid_array.size == 0:
        raise ValueError("The array contains only NaN values.")
    closest_index_in_valid = np.argmin(np.abs(valid_array - value))
    original_index = np.where(valid_mask)[0][closest_index_in_valid]
    return int(original_index)

def plot_concentration(ax, n, x_centerst, source_st, source_ft, grt, st, ft, s_steadyt, f_steadyt, time_to_save, threshold_growth):
    ax.fill_between(x_centerst[n], source_st[n], color="red", alpha=0.5)
    ax.fill_between(x_centerst[n], source_ft[n], color="blue", alpha=0.5)
    ax.fill_between(x_centerst[n], threshold_growth * grt[n], color="green", alpha=0.5)
    ax.plot(x_centerst[n], st[n], 'r--')
    ax.plot(x_centerst[n], ft[n], 'b--')
    ax.plot(x_centerst[n], s_steadyt[n], 'r')
    ax.plot(x_centerst[n], f_steadyt[n], 'b')
    ax.set_title(f't = {round(time_to_save[n], 2)}')
    ax.set_xlabel('Position, x')
    ax.set_ylabel('Concentration, c(x)')
    ax.set_ylim(0, 0.4)

def plot_concentration_profiles(params, g, threshold_growth, folder,Lfinals_to_reach,subdir):
    for nfolder in os.listdir(folder):
        if str(g) in nfolder and str(threshold_growth) in nfolder:
            nfolder_path = os.path.join(folder, nfolder)
            time_to_save = np.load(os.path.join(nfolder_path, 'time_to_save.npy'))
            grsizet = np.load(os.path.join(nfolder_path, 'grsizet.npy'))
            grt = np.load(os.path.join(nfolder_path, 'grt.npy'))
            x_centerst = np.load(os.path.join(nfolder_path, 'x_centerst.npy'))
            x_gridt = np.load(os.path.join(nfolder_path, 'x_gridt.npy'))
            Lt = np.load(os.path.join(nfolder_path, 'Lt.npy'))
            st = np.load(os.path.join(nfolder_path, 'st.npy'))
            ft = np.load(os.path.join(nfolder_path, 'ft.npy'))
            s_steadyt = np.load(os.path.join(nfolder_path, 's_steadyt.npy'))
            f_steadyt = np.load(os.path.join(nfolder_path, 'f_steadyt.npy'))
            source_st = np.load(os.path.join(nfolder_path, 'source_st.npy'))
            source_ft = np.load(os.path.join(nfolder_path, 'source_ft.npy'))
            break

    nrows, ncols = 1, 3
    fig, axarr = plt.subplots(nrows, ncols, figsize=(default_figsize["large"][0], default_figsize["large"][1]/5), sharex=True, sharey=True)
    t_to_plot = np.arange(0, params['tmax'] + params['small_number'], params['tmax'] / nrows)

    nt0 = 0
    # nt1 = find_closest_index((grsizet / Lt) / (grsizet / Lt)[nt0], 0.5)
    # nt2 = np.where(grsizet == 0)[0][0] if len(np.where(grsizet == 0)[0]) > 0 else len(grsizet)-1

    L20 = Lt[0] + 0.2 * (Lfinals_to_reach[0] - Lt[0])
    L80 = Lt[0] + 0.8 * (Lfinals_to_reach[0] - Lt[0])
    nt1 = find_closest_index(Lt,L20)
    nt2 = find_closest_index(Lt,L80)-1
    

    plot_concentration(axarr[0], nt0, x_centerst, source_st, source_ft, grt, st, ft, s_steadyt, f_steadyt, time_to_save, threshold_growth)
    plot_concentration(axarr[1], nt1, x_centerst, source_st, source_ft, grt, st, ft, s_steadyt, f_steadyt, time_to_save, threshold_growth)
    plot_concentration(axarr[2], nt2, x_centerst, source_st, source_ft, grt, st, ft, s_steadyt, f_steadyt, time_to_save, threshold_growth)

    plt.savefig(f'fig/{subdir}_morph_profiles_t0_t1_t2_dynamics_g_{g}.pdf', bbox_inches='tight')
    #plt.show()

    nrows, ncols = 201, 1
    fig, axarr = plt.subplots(nrows, ncols, figsize=(default_figsize["medium"][0], default_figsize["medium"][0]), sharex=True, sharey=True, gridspec_kw={'hspace': 0})
    #t_to_plot = np.linspace(0, params['tmax'], nrows)
    nt_max= min(len(time_to_save) - 1,nt2+10)
    t_to_plot = np.linspace(0, time_to_save[nt_max], nrows)
    n_to_plot = [int(t / params['dt'] / (params['ndt'] / params['ndt_to_save'])) for t in t_to_plot]
    nt = [n_to_plot[find_closest_index(n_to_plot, nt0)], n_to_plot[find_closest_index(n_to_plot, nt1)], n_to_plot[find_closest_index(n_to_plot, nt2)]]

    middle = 0
    black_list=[]
    for i in range(nrows):
        last_black= False
        ax_i = axarr[i]
        n = n_to_plot[i]
        if grsizet[n] != 0:
            x0gr = x_centerst[n][np.nonzero(grt[n])[0][0]]
            x_start = middle - Lt[n]/2
            ax_i.add_patch(plt.Rectangle((x_start + x0gr, 0), grsizet[n], 1, color='green', alpha=0.5))
        else:
            x_start = middle - Lt[n]/2

        if n in nt and n not in black_list:
            black_list.append(n)
            ax_i.add_patch(plt.Rectangle((x_start, 0), Lt[n], 1, color='black'))
        else:
            ax_i.add_patch(plt.Rectangle((x_start, 0), Lt[n], 1, color='gray', alpha=0.5))

        ax_i.add_patch(plt.Rectangle((x_start + params['x0'], 0), params['w'], 1, color='red', alpha=0.5))
        ax_i.add_patch(plt.Rectangle((x_start + Lt[n] - params['w'] - params['x0'], 0), params['w'], 1, color='blue', alpha=0.5))
        ax_i.set_xlim(-0.6*max(Lt), 0.6*max(Lt))
        ax_i.set_axis_off()

    plt.savefig(f'fig/{subdir}_morph_kymograph_dynamics_g_{g}.pdf', bbox_inches='tight')
    #plt.show()

import re
def compute_effective_growth_rate(folder, g_to_test, thresholds_to_test, Lfinals_to_reach):
    eff_growth_rates = {}
    th = thresholds_to_test[0]
    L90 = lambda L0, Lfinal: L0 + 0.2 * (Lfinal - L0)

    for g in g_to_test:
        for nfolder in os.listdir(folder):
            if re.search(rf"th_{th}[_]?g_{g}(?![0-9.])", nfolder):
                nfolder_path = os.path.join(folder, nfolder)
                time_to_save = np.load(os.path.join(nfolder_path, 'time_to_save.npy'))
                Lt = np.load(os.path.join(nfolder_path, 'Lt.npy'))
                L_target = L90(Lt[0], Lfinals_to_reach[0])

                idx = np.argmax(Lt >= L_target)
                if idx > 0:
                    eff_growth_rates[g] = (L_target - Lt[0]) / time_to_save[idx] / Lt[0]
                else:
                    eff_growth_rates[g] = np.nan
                break
        
        #print(g,Lt[0],L_target,Lfinals_to_reach[0],idx,time_to_save[idx],eff_growth_rates)
        
    return eff_growth_rates

def plot_Lfinal_ratio_combined(thresholds_to_test,thresholds_to_test_one, Lfinals_to_reach,Lfinals_to_reach_one, all_Lfinal_sim):
    colors = ['C0', 'C1', 'C2','C3']
    fig = plt.figure(figsize=(9 * 0.3937, 4.5 * 0.3937))
    ax = plt.subplot()
    th = thresholds_to_test[0]
  
    free_text_label=['Two morphogen growth rule','Absolute growth','Relativ overlap','One morphogen growth rule']
    #print(all_Lfinal_sim)
    for i, (label, Lfinal_sim) in enumerate(all_Lfinal_sim.items()):
        if label == 'one_morph':
            th_one=thresholds_to_test_one[0]
            print(thresholds_to_test_one)
            print(Lfinal_sim)
            yvals = np.array([Lfinal_sim[g][th_one] for g in Lfinal_sim.keys()]) / Lfinals_to_reach_one[0]
            xvals = np.array([g for g in Lfinal_sim.keys()])
            xvals = xvals/xvals[-1]*5
            ax.plot(xvals, yvals, 'o', markerfacecolor='none', label=free_text_label[i], color=colors[i % len(colors)],markersize=4)
            continue
        yvals = np.array([Lfinal_sim[g][th] for g in Lfinal_sim.keys()]) / Lfinals_to_reach[0]
        xvals = np.array([g for g in Lfinal_sim.keys()])
        xvals = xvals/xvals[-1]*5
        ax.plot(xvals, yvals, 'o', markerfacecolor='none',label=free_text_label[i], color=colors[i % len(colors)],markersize=4)

    ax.axhline(1.0, color='black', linewidth=0.5)
    ax.set_xlabel(r'Growth parameter, $g/\beta$, $G/L_0\beta$, $20 \gamma\Theta^2/\beta$')
    ax.set_ylabel(r'$L^*_{\mathrm{sim}} / L^*_{\mathrm{adiabatic}}$')
    
    ax.set_ylim(0, 1.2)
    ax.set_xlim(left=0)
    #ax.set_title(f'Threshold = {np.round(th, 2)}')
    ax.legend(loc='lower right') 
    plt.subplots_adjust(left=0.18,bottom=0.27)
    plt.savefig('fig/Lfinal_ratio_combined.pdf', bbox_inches='tight')
    plt.savefig('fig/Lfinal_ratio_combined.eps', bbox_inches='tight')
    plt.savefig('fig/Lfinal_ratio_combined.svg', bbox_inches='tight')
    plt.show()

def plot_Lfinal_ratio_combined_dL(thresholds_to_test,thresholds_to_test_one, Lfinals_to_reach,Lfinals_to_reach_one, all_Lfinal_sim):
    colors = ['C0', 'C1', 'C2','C3']
    fig = plt.figure(figsize=(9 * 0.3937, 4.5 * 0.3937))
    ax = plt.subplot()
    th = thresholds_to_test[0]
  
    free_text_label=['Two morphogen growth rule','Absolute growth','Relativ overlap','One morphogen growth rule']
    #print(all_Lfinal_sim)
    for i, (label, Lfinal_sim) in enumerate(all_Lfinal_sim.items()):
        if label == 'one_morph':
            th_one=thresholds_to_test_one[0]
            print(thresholds_to_test_one)
            print(Lfinal_sim)
            yvals = np.array([Lfinal_sim[g][th_one]-1.8 for g in Lfinal_sim.keys()]) / (Lfinals_to_reach_one[0]-1.8)
            xvals = np.array([g for g in Lfinal_sim.keys()])
            xvals = xvals/xvals[-1]*5
            ax.plot(xvals, yvals, 'o', markerfacecolor='none', label=free_text_label[i], color=colors[i % len(colors)],markersize=4)
            continue
        yvals = np.array([Lfinal_sim[g][th]-1.8 for g in Lfinal_sim.keys()]) / (Lfinals_to_reach[0]-1.8)
        xvals = np.array([g for g in Lfinal_sim.keys()])
        xvals = xvals/xvals[-1]*5
        ax.plot(xvals, yvals, 'o', markerfacecolor='none',label=free_text_label[i], color=colors[i % len(colors)],markersize=4)

    ax.axhline(1.0, color='black', linewidth=0.5)
    ax.set_xlabel(r'Growth parameter, $g/\beta$, $G/L_0\beta$, $20 \gamma\Theta^2/\beta$')
    ax.set_ylabel(r'$(L^*_{\mathrm{sim}} - L_0) / (L^*_{\mathrm{adiabatic}} - L_0)$')
    
    ax.set_ylim(0, 1.2)
    ax.set_xlim(left=0)
    #ax.set_title(f'Threshold = {np.round(th, 2)}')
    ax.legend(loc='lower right') 
    plt.subplots_adjust(left=0.18,bottom=0.27)
    plt.savefig('fig/Lfinal_ratio_combined_dL.pdf', bbox_inches='tight')
    plt.savefig('fig/Lfinal_ratio_combined_dL.eps', bbox_inches='tight')
    plt.savefig('fig/Lfinal_ratio_combined_dL.svg', bbox_inches='tight')
    plt.show()

# def plot_Lfinal_ratio_combined(thresholds_to_test, thresholds_to_test_one, Lfinals_to_reach,
#                                 Lfinals_to_reach_one, all_Lfinal_sim):
#     markers = ['s', 'D', '^', 'v', '<', '>', 'p', 'h']  # distinct markers, no dot or cross
#     fig = plt.figure(figsize=(9 * 0.3937, 4.5 * 0.3937))
#     ax = plt.subplot()
#     th = thresholds_to_test[0]

#     free_text_label = ['Two morphogen growth rule', 'Absolute growth', 'Relativ overlap', 'One morphogen growth rule']

#     for i, (label, Lfinal_sim) in enumerate(all_Lfinal_sim.items()):
#         marker = markers[i % len(markers)]

#         if label == 'one_morph':
#             th_one = thresholds_to_test_one[0]
#             yvals = np.array([Lfinal_sim[g][th_one] for g in Lfinal_sim.keys()]) / Lfinals_to_reach_one[0]
#             xvals = np.array([g for g in Lfinal_sim.keys()])
#             xvals = xvals / xvals[-1]
#             ax.plot(xvals, yvals, marker, label=free_text_label[i], color='black')
#             continue

#         yvals = np.array([Lfinal_sim[g][th] for g in Lfinal_sim.keys()]) / Lfinals_to_reach[0]
#         xvals = np.array([g for g in Lfinal_sim.keys()])
#         xvals = xvals / xvals[-1]
#         ax.plot(xvals, yvals, marker, label=free_text_label[i], color='black')

#     ax.axhline(1.0, color='black', linewidth=0.5)
#     ax.set_xlabel(r'Growth parameter, $g/\beta$, $G/L_0\beta$, $20 \gamma\Theta^2/\beta$')
#     ax.set_ylabel(r'$L^*_{\mathrm{sim}} / L^*_{\mathrm{adiabatic}}$')
#     ax.set_ylim(0, 1.2)
#     ax.set_xlim(left=0)
#     ax.legend(loc='lower right')
#     plt.subplots_adjust(left=0.18, bottom=0.27)
#     plt.savefig('fig/Lfinal_ratio_combined.pdf', bbox_inches='tight')
#     plt.savefig('fig/Lfinal_ratio_combined.eps', bbox_inches='tight')
#     plt.savefig('fig/Lfinal_ratio_combined.svg', bbox_inches='tight')
#     plt.show()

def plot_concentration_one(ax, n, x_centerst, source_st, grt, st , s_steadyt, time_to_save, threshold_growth):
    ax.fill_between(x_centerst[n], source_st[n], color="red", alpha=0.5)
    ax.fill_between(x_centerst[n], threshold_growth * grt[n], color="green", alpha=0.5)
    ax.plot(x_centerst[n], st[n], 'r--')
    ax.plot(x_centerst[n], s_steadyt[n], 'r')
    ax.set_title(f't = {round(time_to_save[n], 2)}')
    ax.set_xlabel('Position, x')
    ax.set_ylabel('Concentration, c(x)')
    ax.set_ylim(0, 0.4)


def plot_concentration_profiles_one(params, g, threshold_growth, folder,Lfinals_to_reach,subdir):
    for nfolder in os.listdir(folder):
        if str(g) in nfolder and str(threshold_growth) in nfolder:
            nfolder_path = os.path.join(folder, nfolder)
            time_to_save = np.load(os.path.join(nfolder_path, 'time_to_save.npy'))
            grsizet = np.load(os.path.join(nfolder_path, 'grsizet.npy'))
            grt = np.load(os.path.join(nfolder_path, 'grt.npy'))
            x_centerst = np.load(os.path.join(nfolder_path, 'x_centerst.npy'))
            Lt = np.load(os.path.join(nfolder_path, 'Lt.npy'))
            st = np.load(os.path.join(nfolder_path, 'st.npy'))
            s_steadyt = np.load(os.path.join(nfolder_path, 's_steadyt.npy'))
            source_st = np.load(os.path.join(nfolder_path, 'source_st.npy'))
            break

    nrows, ncols = 1, 3
    fig, axarr = plt.subplots(nrows, ncols, figsize=(default_figsize["large"][0], default_figsize["large"][1]/5), sharex=True, sharey=True)
    t_to_plot = np.arange(0, params['tmax'] + params['small_number'], params['tmax'] / nrows)

    nt0 = 0
    # nt1 = find_closest_index((grsizet / Lt) / (grsizet / Lt)[nt0], 0.5)
    # nt2 = np.where(grsizet == 0)[0][0] if len(np.where(grsizet == 0)[0]) > 0 else len(grsizet)-1

    L20 = Lt[0] + 0.2 * (Lt[-1] - Lt[0]) #attention 20 and 80% of sim growth
    L80 = Lt[0] + 0.8 * (Lt[-1] - Lt[0])
    nt1 = find_closest_index(Lt,L20)
    nt2 = find_closest_index(Lt,L80)-1
    

    plot_concentration_one(axarr[0], nt0, x_centerst, source_st, grt, st, s_steadyt, time_to_save, threshold_growth)
    plot_concentration_one(axarr[1], nt1, x_centerst, source_st, grt, st, s_steadyt, time_to_save, threshold_growth)
    plot_concentration_one(axarr[2], nt2, x_centerst, source_st, grt, st, s_steadyt, time_to_save, threshold_growth)

    plt.savefig(f'fig/{subdir}_morph_profiles_t0_t1_t2_dynamics_g_{g}.pdf', bbox_inches='tight')
    plt.show()

    nrows, ncols = 201, 1
    fig, axarr = plt.subplots(nrows, ncols, figsize=(default_figsize["medium"][0], default_figsize["medium"][0]), sharex=True, sharey=True, gridspec_kw={'hspace': 0})
    #t_to_plot = np.linspace(0, params['tmax'], nrows)
    nt_max= min(len(time_to_save) - 1,nt2+10)
    t_to_plot = np.linspace(0, time_to_save[nt_max], nrows)
    n_to_plot = [int(t / params['dt'] / (params['ndt'] / params['ndt_to_save'])) for t in t_to_plot]
    nt = [n_to_plot[find_closest_index(n_to_plot, nt0)], n_to_plot[find_closest_index(n_to_plot, nt1)], n_to_plot[find_closest_index(n_to_plot, nt2)]]

    middle = 0
    black_list=[]
    for i in range(nrows):
        
        ax_i = axarr[i]
        n = n_to_plot[i]
        if grsizet[n] != 0:
            x0gr = x_centerst[n][np.nonzero(grt[n])[0][0]]
            x_start = middle - Lt[n]/2
            ax_i.add_patch(plt.Rectangle((x_start + x0gr, 0), grsizet[n], 1, color='green', alpha=0.5))
        else:
            x_start = middle - Lt[n]/2

        if n in nt and  n not in black_list:
            black_list.append(n)
            ax_i.add_patch(plt.Rectangle((x_start, 0), Lt[n], 1, color='black'))
        else:
            ax_i.add_patch(plt.Rectangle((x_start, 0), Lt[n], 1, color='gray', alpha=0.5))

        ax_i.add_patch(plt.Rectangle((x_start + params['x0'], 0), params['w'], 1, color='red', alpha=0.5))
        ax_i.set_xlim(-0.6*max(Lt), 0.6*max(Lt))
        ax_i.set_axis_off()

    plt.savefig(f'fig/{subdir}_morph_kymograph_dynamics_g_{g}.pdf', bbox_inches='tight')
    plt.show()


def main():
    base_folder = 'growth_simulations/figure_s5_effect_of_growth/results_of_numerics/'
    all_subdirs = ['two_morph', 'two_morph_static', 'two_morph_gmultiplicative']
    #all_subdirs = ['one_morph']
    all_Lfinal_sim = {}
    all_eff_growth = {}

    for subdir in all_subdirs:
        folder = os.path.join(base_folder, subdir, 'dynamics')
        param_file = os.path.join(folder, "parameters.txt")
        params = parse_parameters(param_file)

        required_keys = ['x0', 'alpha', 'w', 'beta', 'D', 'L0', 'lam']
        for key in required_keys:
            if key not in params:
                raise KeyError(f"Missing required parameter: {key}")

        folders = list_visible_folders(folder)
        thresholds_to_test = np.unique([float(f.split('_')[1]) for f in folders])
        g_to_test = np.unique([float(f.split('_')[-1]) for f in folders])

        Lfinals = np.linspace(0, 4 * params['L0'], 100)
        thresholds = compute_thresholds(params, Lfinals)
        Lfinals_to_reach = compute_Lfinals_to_reach(params, thresholds_to_test)
        Lfinal_simulated = collect_simulated_Lfinal(folder, thresholds_to_test, g_to_test)

        all_Lfinal_sim[subdir] = Lfinal_simulated
        all_eff_growth[subdir] = compute_effective_growth_rate(folder, g_to_test, thresholds_to_test, Lfinals_to_reach)

        # plot_dynamics(folder, thresholds_to_test, g_to_test)
        # plot_final_vs_threshold(thresholds, thresholds_to_test, Lfinals, Lfinals_to_reach, Lfinal_simulated, params)
        # plot_kymograph_stack(folder, thresholds_to_test, g_to_test, params)

        # g = g_to_test[0]
        # threshold_growth = thresholds_to_test[0]
        # plot_concentration_profiles(params, g, threshold_growth, folder,Lfinals_to_reach,subdir)

        # g = g_to_test[-1]
        # threshold_growth = thresholds_to_test[0]
        # plot_concentration_profiles(params, g, threshold_growth, folder,Lfinals_to_reach,subdir)
    
    print(all_eff_growth)
    
    # return

    
    subdir = 'one_morph'
    
    folder = os.path.join(base_folder, subdir, 'dynamics')
    param_file = os.path.join(folder, "parameters.txt")
    params = parse_parameters(param_file)

    required_keys = ['x0', 'alpha', 'w', 'beta', 'D', 'L0', 'lam']
    for key in required_keys:
        if key not in params:
            raise KeyError(f"Missing required parameter: {key}")

    folders = list_visible_folders(folder)
    thresholds_to_test_one = np.unique([float(f.split('_')[1]) for f in folders])
    g_to_test = np.unique([float(f.split('_')[-1]) for f in folders])

    Lfinals = np.linspace(0, 4 * params['L0'], 100)
    thresholds = compute_thresholds_one(params, Lfinals)
    Lfinals_to_reach_one = compute_Lfinals_to_reach_one(params, thresholds_to_test_one)
    Lfinal_simulated = collect_simulated_Lfinal(folder, thresholds_to_test_one, g_to_test)

    #all_Lfinal_sim[subdir] = Lfinal_simulated
    #all_eff_growth[subdir] = compute_effective_growth_rate(folder, g_to_test, thresholds_to_test, Lfinals_to_reach)

    # plot_dynamics(folder, thresholds_to_test, g_to_test)
    # plot_final_vs_threshold(thresholds, thresholds_to_test, Lfinals, Lfinals_to_reach, Lfinal_simulated, params)
    # # plot_kymograph_stack(folder, thresholds_to_test, g_to_test, params)
    # plot_Lfinal_ratio_vs_growth(g_to_test, thresholds_to_test, Lfinal_simulated, Lfinals_to_reach)
    
    # g = g_to_test[0]
    # threshold_growth = thresholds_to_test[0]
    # plot_concentration_profiles_one(params, g, threshold_growth, folder,Lfinals_to_reach,subdir)

    # g = g_to_test[-1]
    # threshold_growth = thresholds_to_test[0]
    # plot_concentration_profiles_one(params, g, threshold_growth, folder,Lfinals_to_reach,subdir)
   
    all_subdirs.append(subdir)
    all_Lfinal_sim[subdir] = Lfinal_simulated
    
    plot_Lfinal_ratio_combined(thresholds_to_test,thresholds_to_test_one, Lfinals_to_reach,Lfinals_to_reach_one, all_Lfinal_sim)
    plot_Lfinal_ratio_combined_dL(thresholds_to_test,thresholds_to_test_one, Lfinals_to_reach,Lfinals_to_reach_one, all_Lfinal_sim)

if __name__ == "__main__":
    main()